module Xcode
  class PBXBuildFile
    include PBXFormatter
    attr_reader :id, :file_ref
    
    def self.new_from_file(file, file_type = nil)
      file_ref = Xcode::PBXFileReference.new_from_file(file, file_type)
      new file_ref, file_type
    end
    
    def initialize(file_ref, file_type = nil)
      @id = Xcode.register(self)
      @file_ref = file_ref
      @file_type = file_type
    end
    
    def attributes
      {"fileRef" => @file_ref.id, "isa" => isa}
    end
    
    def isa
      "PBXBuildFile"
    end
  end
end
