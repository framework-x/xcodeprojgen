require "digest/md5"

module Xcode
  def self.objects
    @objects ||= {}
  end
  
  def self.register(object)
    id = Digest::MD5.hexdigest(rand.to_s + Time.now.usec.to_s).upcase[0,24]
    objects[id] = object
    id
  end
end

Symbol.class_eval do
  def to_proc
    Proc.new { |o| o.send(self) }
  end
end

$LOAD_PATH << File.dirname(__FILE__)
require "xcode/pbx_formatter"

require "xcode/pbx_build_file"
require "xcode/pbx_file_reference"
require "xcode/pbx_group"
require "xcode/pbx_proj"
require "xcode/pbx_project"
require "xcode/pbx_native_target"
require "xcode/pbx_build_phase"
require "xcode/pbx_copy_files_build_phase"
require "xcode/pbx_frameworks_build_phase"
require "xcode/pbx_headers_build_phase"
require "xcode/pbx_resources_build_phase"
require "xcode/pbx_sources_build_phase"
require "xcode/xc_configuration_list"
require "xcode/xc_build_configuration"

require "xcode/frameworks"
require "xcode/iphone"
__END__
PBXBuildFile
PBXFileReference
PBXGroup

PBXProject
- PBXNativeTarget
-- PBXFrameworksBuildPhase
-- PBXResourcesBuildPhase
-- PBXSourcesBuildPhase
-- XCConfigurationList
--- XCBuildConfiguration

target has_many :build_phases
project has_many :targets
configuration_list has_many :build_configurations
target has_ony :buildConfigurationList
