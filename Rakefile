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
task :default => ["db:test:prepare", "db:seed", :spec, :cucumber]

BigbluebuttonRailsPlayground::Application.load_tasks
