FactoryGirl.define do
  factory :bigbluebutton_room, aliases: [:webconf_room] do |f|
    f.association :server, :factory => :bigbluebutton_server
    f.sequence(:meetingid) { |n| "meeting-#{n}-" + SecureRandom.hex(4) }
    f.sequence(:name) { |n| "Name#{n}" }
    f.attendee_password { Forgery(:basic).password :at_least => 5, :at_most => 16 }
    f.moderator_password { Forgery(:basic).password :at_least => 5, :at_most => 16 }
    f.welcome_msg { Forgery(:lorem_ipsum).sentences(2) }
    f.private false
    f.randomize_meetingid false
    f.sequence(:param) { |n| "meeting-#{n}" }
    f.external false
  end
end
