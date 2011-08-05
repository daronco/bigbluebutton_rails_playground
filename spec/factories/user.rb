Factory.define :user do |u|
  u.sequence(:name) { |n| "User Name #{n}" }
  u.sequence(:email) { |n| "user#{n}@example.com" }
  u.password Forgery(:basic).password :at_least => 10, :at_most => 16
  u.password_confirmation { |u| u.password }
  u.after_create { |u| u.confirm! }
end
