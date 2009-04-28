require File.dirname(__FILE__) + "/../test_helper"

class PbxBuildPhaseTest < Test::Unit::TestCase
  Sample = Class.new(Xcode::PBXBuildPhase) do
    def isa
      "PBXSampleBuildPhase"
    end
  end

  test "build_action_mask" do
    phase = Sample.new
    assert_equal "2147483647", phase.attributes["buildActionMask"]
  end
  
  test "files" do
    phase = Sample.new
    file = stub(:id => "ABC")
    phase.files << file
    assert_equal [file], phase.files
    assert_equal ["ABC"], phase.attributes["files"]
  end
  
  test "postprocessing" do
    phase = Sample.new
    assert_equal "0", phase.attributes["runOnlyForDeploymentPostprocesssing"]
  end
end
