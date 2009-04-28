require File.dirname(__FILE__) + "/../test_helper"

class PbxBuildFileTest < Test::Unit::TestCase
  test "to_pbx" do
    file = Xcode::PBXBuildFile.new_from_file(__FILE__)
    assert_match /^\{isa = PBXBuildFile; fileRef = [A-Z0-9]{24};\}$/, file.to_pbx
  end
  
  test "attributes" do
    file = Xcode::PBXBuildFile.new_from_file(__FILE__)
    assert_equal ["isa", "fileRef"].sort, file.attributes.keys.sort
  end
  
  test "isa" do
    file = Xcode::PBXBuildFile.new_from_file(__FILE__)
    assert_equal "PBXBuildFile", file.isa
  end
end
