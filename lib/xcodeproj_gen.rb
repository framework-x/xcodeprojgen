class XcodeprojGen
  def self.generate(project_name = nil, config = nil)
    project_name ||= File.basename(Dir.pwd)
    config ||= YAML.load_file("xcodeproj.yml")
    new(project_name, config).send(:generate)
  end
  
  class << self
    protected :new
  end
  
  def initialize(project_name, config)
    @project_name, @config = project_name, config
  end
  
  protected
  
  def generate
    pbx_proj = Xcode::PBXProj.new @project_name
    @products = {}
    
    files = build_files
    products, targets = build_products_and_targets
    products_group = build_products_group(products.values)
    main_group = build_main_group([files, products_group].flatten)
    project = build_project(main_group, targets)

    pbx_proj.instance_variable_set "@project", project
    FileUtils.mkdir_p "#{@project_name}.xcodeproj"
    File.open("#{@project_name}.xcodeproj/project.pbxproj", "w") { |f| f.write pbx_proj.to_pbx }
  end
  
  def build_products_group(products)
    Xcode::PBXGroup.new(
      "name" => "Products",
      "children" => products.flatten.map(&:id)
    )
  end
  
  def build_main_group(children)
    Xcode::PBXGroup.new(
      "name" => "CustomTemplate",
      "children" => [children, Xcode::IPhone::FrameworksGroup].flatten.map(&:id)
    )
  end
  
  def build_project(main_group, targets)
    _project_build_configurations = @config["build_configurations"].map do |name, settings|
      Xcode::XCBuildConfiguration.new(name.to_s.capitalize, settings)
    end
    project_build_configurations = Xcode::XCConfigurationList.new(_project_build_configurations)

    project = Xcode::PBXProject.new(
      "mainGroup" => main_group.id,
      "targets" => targets.map(&:id),
      "buildConfigurationList" => project_build_configurations.id
    )
  end
  
  def build_files
    directory = File.expand_path(Dir.pwd)
    children = []
    file_type = nil
    Dir.entries(Dir.pwd).each do |entry|
      next if entry =~ /^\./
      next if entry == "build"
      next if entry =~ /xcodeproj$/
      filetype = File.ftype(entry)
      case filetype
      when "directory"
        group = Xcode::PBXGroup.new_from_directory(directory + "/" + entry, file_type)
        children << group
      when "file"
        file_ref = Xcode::PBXFileReference.new_from_file(directory + "/" + entry, file_type)
        children << file_ref
      else
        raise "wtf? #{directory} #{entry} #{File.ftype(directory + "/" + entry)}"
      end
    end
    children
  end
  
  def build_products_and_targets
    products = {}
    targets = []
    @config["targets"].each do |target_config|
      x, y, z = build_target target_config, products
      products[x] = y
      targets << z
    end
    [products, targets]
  end
  
  def build_target(target_config, products_map)
    target_attributes = {}
    target_attributes["buildPhases"] = target_config.delete("build_phases").map do |phase_type, phase_config|
      klass = case phase_type
      when "sources" : Xcode::PBXSourcesBuildPhase
      when "copy_files" : Xcode::PBXCopyFilesBuildPhase
      when "frameworks" : Xcode::PBXFrameworksBuildPhase
      when "headers" : Xcode::PBXHeadersBuildPhase
      else raise("#{phase_type} is not yet supported")
      end
      if phase_type == "frameworks"
        klass.new(
          phase_config.map do |framework|
            if products_map[framework]
              products_map[framework].create_pbx_build_file
            else
              Xcode::Frameworks.const_get(framework).create_pbx_build_file
            end
          end
        )
      else
        klass.new(
          phase_config.delete("files").map do |file_pattern|
            Dir.glob(file_pattern).map do |file|
              Xcode::PBXFileReference.file_reference_for_file(file).create_pbx_build_file
            end
          end.flatten,
          phase_config
        )
      end
    end.map(&:id)
    target_attributes["buildConfigurationList"] = Xcode::XCConfigurationList.new(
      target_config.delete("build_configurations").inject([]) do |configs, (name, settings)|
        configs << Xcode::XCBuildConfiguration.new(name.to_s.capitalize, settings)
      end
    ).id
    product_path = target_config["product"]["path"]
    product = Xcode::PBXFileReference.new({
      "includeInIndex" => "0",
      "sourceTree" => "BUILT_PRODUCTS_DIR"
    }.merge(target_config.delete("product")))
    target_attributes["productReference"] = product.id
    target = Xcode::PBXNativeTarget.new(target_config.delete("name"),
      target_attributes.merge(target_config)
    )
    [product_path, product, target]
  end
end
