require File.dirname(__FILE__) + "/test_helper"

class CommandLineInCTest < Test::Unit::TestCase
  PROJECT_DIR = File.expand_path(EXAMPLES_DIR + "/clu_c")
  
  def setup
    FileUtils.rm_rf "#{PROJECT_DIR}/build"
    FileUtils.rm_rf "#{PROJECT_DIR}/clu_c.xcodeproj"
    chdir { run_xcodeprojgen }
  end

  test "building with debug configuration" do
    chdir do
      system "xcodebuild -project clu_c.xcodeproj -sdk macosx10.5 -configuration Debug -target clu_c > /dev/null"
      raise "failed to build debug config" unless $?.success?
    end
    output = `#{PROJECT_DIR}/build/Debug/clu_c`
    assert_equal "Hello, World!\n", output
  end

  test "building with release configuration" do
    chdir do
      system "xcodebuild -project clu_c.xcodeproj -sdk macosx10.5 -configuration Release -target clu_c > /dev/null"
      raise "failed to build release config" unless $?.success?
    end
    output = `#{PROJECT_DIR}/build/Release/clu_c`
    assert_equal "Hello, World!\n", output
  end
  
  def chdir
    Dir.chdir(PROJECT_DIR) { yield }
  end
end
