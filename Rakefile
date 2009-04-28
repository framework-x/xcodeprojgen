require "rake/testtask"

task :default => :test

task :test => %w[test:unit test:acceptance]
namespace :test do
  Rake::TestTask.new(:acceptance) do |t|
    t.pattern = "test/acceptance/**/*_test.rb"
  end

  Rake::TestTask.new(:unit) do |t|
    t.pattern = "test/unit/**/*_test.rb"
  end
end
