require File.dirname(__FILE__) + "/../test_helper"

class PbxGroupTest < Test::Unit::TestCase
  def test_isa
    group = Xcode::PBXGroup.new({})
    assert_equal "PBXGroup", group.attributes["isa"]
  end

  def test_source_tree
    group = Xcode::PBXGroup.new({})
    assert_equal "<group>", group.attributes["sourceTree"]
  end
  
  def test_attributes_merge
    group = Xcode::PBXGroup.new "key" => "value"
    assert_equal "value", group.attributes["key"]
  end

  def test_smoke_test_to_pbx
    assert_nothing_raised do
      group = Xcode::PBXGroup.new({})
      group.to_pbx
    end
  end
end
