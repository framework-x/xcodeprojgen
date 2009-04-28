$LOAD_PATH << File.dirname(__FILE__) + "/../lib"
require "xcode"

require "test/unit"
require "rubygems"
gem "mocha", "0.9.5"
require "mocha"

Test::Unit::TestCase.class_eval do
  def self.test(method, &block)
    define_method "test_#{method}".gsub(/\W/,"_"), &block
  end  
end
