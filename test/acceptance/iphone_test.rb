require File.dirname(__FILE__) + "/test_helper"

class IphoneTest < Test::Unit::TestCase
  PROJECT_DIR = File.expand_path(EXAMPLES_DIR + "/iphone")
  
  def setup
    FileUtils.rm_rf "#{PROJECT_DIR}/build"
    FileUtils.rm_rf "#{PROJECT_DIR}/iphone.xcodeproj"
    chdir { run_xcodeprojgen }
  end

  puts "skipping #{__FILE__}:#{__LINE__}"
  test "building with debug configuration, simulator 2.0 sdk" do
    next
    chdir do
      output = `xcodebuild -project iphone.xcodeproj -configuration Debug -target IphoneApp -sdk iphonesimulator2.0`
      raise "failed to build debug config (exitstatus)" unless $?.success?
      raise "failed to build debug config (output)" unless output.include?("** BUILD SUCCEEDED **")
    end
  end
  
  def chdir
    Dir.chdir(PROJECT_DIR) { yield }
  end
end
