require 'rubocop/rake_task' # rubocop:disable Style/FrozenStringLiteralComment

task default: %w[lint test]

RuboCop::RakeTask.new(:lint) do |task|
  task.requires << 'rubocop-minitest'
  task.requires << 'rubocop-rake'
  task.patterns = ['lib/**/*.rb', 'test/**/*.rb', 'Rakefile']
  task.fail_on_error = false
end

desc 'This task runs the app'
task :run do
  ruby 'main.rb'
end

desc 'This task runs tests'
task :test do
  ruby 'test/app_test.rb'
end
