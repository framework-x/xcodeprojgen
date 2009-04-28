require File.dirname(__FILE__) + "/../test_helper"

class PbxFormatterTest < Test::Unit::TestCase
  def test_to_pbx
    klass = Class.new do
      include Xcode::PBXFormatter
      
      def id
        "_id_"
      end
      
      def attributes
        {"a" => "b", "c" => "d"}
      end
    end
    instance = klass.new
    assert_equal "{a = b; c = d;}", instance.to_pbx
  end
  
  def test_to_pbx_with_array
    klass = Class.new do
      include Xcode::PBXFormatter
      
      def id
        "_id_"
      end
      
      def attributes
        {"a" => ["b", "c", "d"]}
      end
    end
    instance = klass.new
    assert_equal "{a = (b, c, d);}", instance.to_pbx
  end
end
