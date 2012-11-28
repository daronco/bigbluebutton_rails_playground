FactoryGirl.define do
  factory :user do |f|
    f.sequence(:name) { |n| Forgery::Name.unique_full_name(n) }
    f.sequence(:username) { |n| Forgery::Internet.unique_user_name(n) }
    f.sequence(:email) { |n| Forgery::Internet.unique_email_address(n) }
    f.superuser false
    f.password Forgery(:basic).password :at_least => 10, :at_most => 16
    f.password_confirmation { |u| u.password }
    f.association :profile
    after(:create) { |u| u.confirm! }
  end

  factory :superuser, :parent => :user do |u|
    u.superuser true
  end
end
