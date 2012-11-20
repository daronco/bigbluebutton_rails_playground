# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Make sure the config file exists and load it
CONFIG_FILENAME = "application.yml"
CONFIG_FILE = File.join(::Rails.root, "config", CONFIG_FILENAME)
DEFAULT_CONFIG_FILE = File.join(::Rails.root, "config", "#{CONFIG_FILENAME}.example")
unless File.exists? DEFAULT_CONFIG_FILE
  puts
  puts "ERROR"
  puts "The default configuration file does not exists! Make sure your repository is up to date."
  puts "Path: #{DEFAULT_CONFIG_FILE}"
  puts
  exit
end

puts "* Create the default site"
puts "  name: #{configatron.site.name}"
puts "  description: #{configatron.site.description}"
puts "  locale: #{configatron.site.locale}"
puts "  domain: #{configatron.site.domain}"
puts "  smtp_user_name: #{configatron.site.smtp_user_name}"
puts "  smtp_password: #{configatron.site.smtp_password.gsub(/./, "*") unless configatron.site.smtp_password.blank?}"
puts "  smtp configurations defaults to Gmail"
params = {
  :name => configatron.site.name,
  :description => configatron.site.description,
  :smtp_user_name => configatron.site.smtp_user_name,
  :smtp_sender => configatron.site.smtp_user_name,
  :smtp_password => configatron.site.smtp_password,
  :smtp_auto_tls => true,
  :smtp_server => "smtp.gmail.com",
  :smtp_port => 587,
  :smtp_domain => "gmail.com",
  :smtp_auth_type => :plain,
  :locale => configatron.site.locale,
  :domain => configatron.site.domain,
}
if Site.count > 0
  Site.current.update_attributes params
else
  Site.create! params
end

puts "* Create the administrator account"
puts "  username: #{configatron.admin.username}"
puts "  fullname: #{configatron.admin.name}"
puts "  email: #{configatron.admin.email}"
puts "  password: #{configatron.admin.password}"
params = {
  :username => configatron.admin.username,
  :email => configatron.admin.email,
  :password => configatron.admin.password,
  :password_confirmation => configatron.admin.password,
  :name => configatron.admin.name,
  :superuser => true
}
u = User.new params
u.skip_confirmation!
unless u.save
  puts "ERROR!"
  puts u.errors.inspect
end
