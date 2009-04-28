require File.dirname(__FILE__) + "/../test_helper"

class XcBuildConfigurationTest < Test::Unit::TestCase
  def test_isa
    config = Xcode::XCBuildConfiguration.new "name", {}
    assert_equal "XCBuildConfiguration", config.attributes["isa"]
  end
  
  def test_name_and_build_settings
    build_settings = {"foo" => "bar"}
    config = Xcode::XCBuildConfiguration.new "name", build_settings
    assert_equal "name", config.attributes["name"]
    assert_equal build_settings, config.attributes["buildSettings"]
  end
end
