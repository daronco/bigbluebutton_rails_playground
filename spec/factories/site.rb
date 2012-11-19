FactoryGirl.define do
  FactoryGirl.define do
    factory :site do |f|
      f.name Forgery::Name.company_name
      f.description Forgery::Basic.text
      f.domain Forgery::Internet.domain_name
      f.signature Forgery::Name.company_name
      f.smtp_login Forgery::Internet.user_name
      f.locale "en"
      f.exception_notifications false
      f.shib_enabled false
      f.chat_enabled false
    end
  end
end
