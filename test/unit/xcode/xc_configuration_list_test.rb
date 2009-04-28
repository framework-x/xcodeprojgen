require File.dirname(__FILE__) + "/../test_helper"

class XcConfigurationListTest < Test::Unit::TestCase
  def test_isa
    list = Xcode::XCConfigurationList.new
    assert_equal "XCConfigurationList", list.attributes["isa"]
  end
  
  def test_attributes
    list = Xcode::XCConfigurationList.new
    assert_equal "0", list.attributes["defaultConfigurationIsVisible"]
    assert_equal "Release", list.attributes["defaultConfigurationName"]
  end
  
  def test_build_configurations
    list = Xcode::XCConfigurationList.new
    list.build_configurations << stub(:id => "id1")
    list.build_configurations << stub(:id => "id2")
    assert_equal ["id1", "id2"], list.attributes["buildConfigurations"]
  end
end
