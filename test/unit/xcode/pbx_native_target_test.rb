require File.dirname(__FILE__) + "/../test_helper"

class PbxNativeTargetTest < Test::Unit::TestCase
  test "attributes" do
    target = Xcode::PBXNativeTarget.new "Butterfly"
    assert_equal "com.apple.product-type.application", target.attributes["productType"]
    assert_equal "Butterfly", target.attributes["productName"]
    assert_equal [], target.attributes["dependencies"]
    assert_equal [], target.attributes["buildRules"]
    assert_equal "PBXNativeTarget", target.attributes["isa"]
    assert_equal "Butterfly", target.attributes["name"]
  end
end
