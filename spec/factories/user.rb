Factory.define :user do |u|
  u.sequence(:name) { |n| "User Name #{n}" }
  u.sequence(:email) { |n| "user#{n}@example.com" }
  u.password "test"
  u.password_confirmation "test"
end
