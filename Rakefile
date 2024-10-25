# frozen_string_literal: true

require 'minitest/test_task'
require 'rubocop/rake_task'

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

Minitest::TestTask.create

desc 'This task runs tests'
task :test
