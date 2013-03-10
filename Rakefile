require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "cucumber"
require "cucumber/rake/task"

RSpec::Core::RakeTask.new(:spec)

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = ["--format pretty", "spec/features"]
end


desc "Run full test suite"
task :test => [:spec, :features]
task :default => :test