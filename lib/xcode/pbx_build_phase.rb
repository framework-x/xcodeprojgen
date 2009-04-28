module Xcode
  class PBXBuildPhase
    include PBXFormatter
    attr_reader :id, :files
    
    def initialize(files = [], attributes = {})
      @id = Xcode.register(self)
      @files = files
      @attributes = attributes
    end
    
    def attributes
      {
        "isa" => isa,
        "buildActionMask" => "2147483647",
        "runOnlyForDeploymentPostprocesssing" => "0",
        "files" => files.map(&:id)
      }.merge(@attributes)
    end
    
    def isa
      raise NotImplementedError, "subclasses must implement isa"
    end
  end
end
