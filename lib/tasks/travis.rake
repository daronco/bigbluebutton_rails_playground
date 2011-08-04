desc "Task for the Travis CI"
task :travis => ["db:test:prepare", "db:seed", :spec]
