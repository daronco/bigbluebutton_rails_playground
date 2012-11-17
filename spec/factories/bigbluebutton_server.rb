FactoryGirl.define do
  factory :bigbluebutton_server do |f|
    f.sequence(:name) { |n| "Server #{n}" }
    f.sequence(:url) { |n| "http://bigbluebutton#{n}.test.com/bigbluebutton/api" }
    f.salt { Forgery(:basic).password :at_least => 30, :at_most => 40 }
    f.version "0.8"
    f.sequence(:param) { |n| "server-#{n}" }
  end
end
