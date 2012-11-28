FactoryGirl.define do
  factory :profile do |f|
    f.city Forgery::Address.city
    f.country Forgery::Address.country
    f.organization Forgery::Name.company_name
    f.about Forgery::LoremIpsum.sentence
    f.address Forgery::Address.street_address
    f.phone Forgery::Address.phone
  end
end
