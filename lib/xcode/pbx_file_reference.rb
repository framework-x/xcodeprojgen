module Xcode
  class PBXFileReference
    include Xcode::PBXFormatter
    attr_reader :id
    
    def self.file_reference_for_file(file)
      @file_references ||= {}
      @file_references[File.expand_path(file)] || raise("cannot find file ref for #{file}")
    end
    
    def self.new_from_file(file, file_type = nil)
      attributes = {}
      attributes["path"] = File.basename(file)
      case File.extname(file)
      when ".h"
        attributes.merge! "lastKnownFileType" => "sourcecode.c.h", "fileEncoding" => "4"
      when ".m"
        attributes.merge! "lastKnownFileType" => "sourcecode.c.objc", "fileEncoding" => "4"
      when ".a"
        attributes.merge! "lastKnownFileType" => "archive.ar", "fileEncoding" => "4"
      when ".plist"
        attributes.merge! "lastKnownFileType" => "text.plist.xml", "fileEncoding" => "4"
      when ".strings"
        attributes.merge! "lastKnownFileType" => "text.plist.strings", "fileEncoding" => "10"
      when ".png", ".tiff", ".jpg", ".jpeg"
        ext = File.extname(file)
        ext = ".jpeg" if ext == ".jpg"
        attributes.merge! "lastKnownFileType" => "image#{ext}"
      else
        attributes.merge! "lastKnownFileType" => "file"
      end
      instance = new attributes, file_type
      @file_references ||= {}
      @file_references[File.expand_path(file)] = instance
      instance
    end

    def initialize(attributes, file_type = nil)
      @file_type = file_type
      @id = Xcode.register(self)
      @attributes = attributes
    end
    
    def attributes
      result = {
        "isa" => isa,
        "sourceTree" => "<group>"
      }.merge @attributes
      result
    end
    
    def isa
      "PBXFileReference"
    end
    
    def create_pbx_build_file
      Xcode::PBXBuildFile.new(self, @file_type)
    end

    protected
    
    def file_extension
      File.extname(attributes["path"]).gsub('"',"")
    end
  end
end
