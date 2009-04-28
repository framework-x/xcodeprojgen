module Xcode
  class PBXProj
    include PBXFormatter
    attr_reader :groups, :project
    
    def initialize(name)
      @name = name
      @groups = []
    end
    
    def attributes
      {
        "objects" => Xcode.objects,
        "rootObject" => @project.id,
        "archiveVersion" => "1",
        "objectVersion" => "45",
        "classes" => {}
      }
    end
  end
end
