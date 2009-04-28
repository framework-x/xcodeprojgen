BIN_DIR = File.expand_path(File.dirname(__FILE__) + "/../../bin")
EXAMPLES_DIR = File.expand_path(File.dirname(__FILE__) + "/../../examples")
LIB_DIR = File.expand_path(File.dirname(__FILE__) + "/../../lib")

require "fileutils"

require "test/unit"

Test::Unit::TestCase.class_eval do
  def self.test(method, &block)
    define_method "test_#{method}".gsub(/\W/,"_"), &block
  end  

  def run_xcodeprojgen
    system "ruby -I #{LIB_DIR} #{BIN_DIR}/xcodeprojgen"
    raise "xcodeprojgen failed" unless $?.success?
  end
end
