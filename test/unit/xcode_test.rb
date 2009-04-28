require File.dirname(__FILE__) + "/test_helper"

class XcodeTest < Test::Unit::TestCase
  def test_random_id_returned_from_register
    assert_match /^[A-Z0-9]{24}$/, Xcode.register(stub(:id => "1", :attributes => {}, :to_pbx => ""))
  end
end
