# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

puts "* Create the default BigBlueButton server"
puts "  name: #{configatron.bbb_server.name}"
puts "  url: #{configatron.bbb_server.url}"
puts "  salt: #{configatron.bbb_server.salt}"
puts "  version: #{configatron.bbb_server.version}"
bbb_server = BigbluebuttonServer.create :name => configatron.bbb_server.name,
                                        :url => configatron.bbb_server.url,
                                        :salt => configatron.bbb_server.salt,
                                        :version => configatron.bbb_server.version
