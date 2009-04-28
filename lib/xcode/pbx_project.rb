module Xcode
  class PBXProject
    include PBXFormatter
    attr_reader :id, :build_configuration_list
    
    def initialize(attributes = {})
      @id = Xcode.register(self)
      @attributes = attributes
    end
    
    def attributes
      {
        "isa" => isa,
        "compatibilityVersion" => "Xcode 3.1",
        "projectDirPath" => "",
        "projectRoot" => "",
        "targets" => [],
      }.merge @attributes
    end
    
    def compatibility_version
      "Xcode 3.1"
    end
    
    def isa
      "PBXProject"
    end
  end
end
