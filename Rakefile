# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.
require 'rubygems'
require 'bundler/setup'
require 'rspec/core/rake_task'
require 'cucumber'
require 'cucumber/rake/task'

require File.expand_path('../config/application', __FILE__)
require 'rake'

desc 'Default: run specs and features.'
task :default => [:spec, :cucumber]

#RSpec::Core::RakeTask.new(:spec => ["db:test:prepare"])
#RSpec::Core::RakeTask.new(:spec => ["db:test:prepare", "db:seed"]) # to run dependencies first

task :best_practices do |app|
  sh "rails_best_practices -f html --spec &>/dev/null"
  puts
  puts "Output will be in the file rails_best_practices_output.html"
  puts
end

BigbluebuttonRailsPlayground::Application.load_tasks
