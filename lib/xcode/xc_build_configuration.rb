module Xcode
  class XCBuildConfiguration
    include PBXFormatter
    attr_reader :id, :build_settings
    
    def initialize(name, build_settings)
      @id = Xcode.register(self)
      @name = name
      @build_settings = build_settings
    end
    
    def attributes
      {
        "isa" => "XCBuildConfiguration",
        "name" => @name,
        "buildSettings" => @build_settings
      }
    end
  end
end
