module Xcode
  class PBXGroup
    include Xcode::PBXFormatter
  
    attr_reader :id, :groups
    
    def self.new_from_directory(directory, file_type)
      children = []
      Dir.entries(directory).each do |entry|
        next if entry =~ /^\./
        filetype = File.ftype(directory + "/" + entry)
        filetype = "file" if File.extname(entry) == ".framework"
        case filetype
        when "directory"
          group = PBXGroup.new_from_directory(directory + "/" + entry, file_type)
          children << group
        when "file"
          file_ref = Xcode::PBXFileReference.new_from_file(directory + "/" + entry, file_type)
          children << file_ref
        else
          raise "wtf? #{directory} #{entry} #{File.ftype(directory + "/" + entry)}"
        end
      end
      new "children" => children.map(&:id), "path" => File.basename(directory)
    end
    
    def self.new_from_subdirectory(directory, file_type)
      paths = directory.split("/")
      bottom = new_from_directory(directory, file_type)
      paths[0..-2].reverse.inject(bottom) do |child, path|
        new "path" => path, "children" => [child.id]
      end
    end

    def initialize(attributes)
      @id = Xcode.register(self)
      @attributes = attributes
    end
    
    def attributes
      {
        "isa" => "PBXGroup",
        "sourceTree" => "<group>"
      }.merge @attributes
    end
  end
end
