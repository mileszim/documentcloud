# Bundler
require 'bundler'
Bundler::GemHelper.install_tasks

# Rspec
begin
  require 'rspec/autorun'
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)

  task :test => :spec
rescue LoadError
  # Nothing
end
