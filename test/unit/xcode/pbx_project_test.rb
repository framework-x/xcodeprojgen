require File.dirname(__FILE__) + "/../test_helper"

class PbxProjectTest < Test::Unit::TestCase
  def test_isa
    project = Xcode::PBXProject.new
    assert_equal "PBXProject", project.isa
  end
  
  def test_compatibility_version
    project = Xcode::PBXProject.new
    assert_equal "Xcode 3.1", project.compatibility_version
  end
  
  def test_attributes
    project = Xcode::PBXProject.new
    assert_equal "PBXProject", project.attributes["isa"]
    assert_equal "Xcode 3.1", project.attributes["compatibilityVersion"]
    assert_equal "", project.attributes["projectDirPath"]
    assert_equal "", project.attributes["projectRoot"]
  end
end
