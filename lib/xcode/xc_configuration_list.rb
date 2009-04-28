module Xcode
  class XCConfigurationList
    include PBXFormatter
    attr_reader :id, :build_configurations
    
    def initialize(build_configurations = [])
      @id = Xcode.register(self)
      @build_configurations = build_configurations
    end
    
    def attributes
      {
        "isa" => "XCConfigurationList",
        "defaultConfigurationIsVisible" => "0",
        "defaultConfigurationName" => "Release",
        "buildConfigurations" => @build_configurations.map(&:id)
      }
    end
  end
end
