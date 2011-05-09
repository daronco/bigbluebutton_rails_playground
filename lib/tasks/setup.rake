namespace "setup" do

  desc ""
  task :all => [ :bigbluebutton_rails, "db:drop:all", "db:create", "db:migrate", "db:test:prepare" ]

  task :bigbluebutton_rails do |app|
    sh "rails destroy bigbluebutton_rails:install"
    sh "rails generate bigbluebutton_rails:install"
  end

end

