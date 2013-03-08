require "bundler/gem_tasks"


desc "Run full test suite"
task :test do
  system "rspec"
  system "cucumber spec/features"
end

task :default => :test