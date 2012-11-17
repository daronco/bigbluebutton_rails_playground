namespace "setup" do

  ###############################################################
  # Overall setup
  ###############################################################

  BASIC_TASKS = %w( setup:config )
  COMMON_TASKS = %w( db:drop db:create db:migrate db:seed )
  TASKS = {
    :development => COMMON_TASKS,
    :production => COMMON_TASKS,
    :test => %w( db:test:prepare db:seed )
  }

  desc "Full setup, from basic configurations to default DB data creation"
  task :full => [ :basic, :db ]

  desc "Basic setup, including git submodules and config files"
  task :basic do
    run_tasks(BASIC_TASKS)
  end

  desc "DB setup, will destroy your entire DB and recreate it"
  task :db do
    if TASKS[::Rails.env.to_sym].nil?
      puts "Can't proceed: wrong enviroment \"#{::Rails.env}\""
    else
      tasks = TASKS[::Rails.env.to_sym]
      run_tasks(tasks)
    end
  end

  def run_tasks(tasks)
    puts
    puts "Running setup for the environment: " + ::Rails.env
    puts
    tasks.each do |t|
      puts "* Running the task: #{t.to_s}"
      Rake::Task[t.to_s].invoke
    end
  end

  ###############################################################
  # Configuration files
  ###############################################################

  desc "Setup the configuration files"
  task :config do
    setup_file("config/application.yml")
    setup_file("config/database.yml")
  end

  def setup_file(file)
    expanded = File.expand_path(File.join(::Rails.root, file))
    puts "* Checking if \"#{expanded}\" exists..."
    if File.exist?(expanded)
      puts "File exists. You should configure it if you didn't yet."
    else
      `cp #{expanded}.example #{expanded}`
      puts
      puts "*** Created the default configuration file, please edit it: #{file}"
      puts
    end
  end

  task :bigbluebutton_rails do |app|
    sh "rails destroy bigbluebutton_rails:install"
    sh "rails generate bigbluebutton_rails:install"
  end

end
