FactoryBot.define do
  factory :profile do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    zip_code { Faker::Address.zip_code }
    phone_number { Faker::PhoneNumber.phone_number }
    street_address { Faker::Address.street_address }
    birth_date { Faker::Date.birthday(min_age: 18, max_age: 90) }
    user # You can associate a user using FactoryBot's associations
  end
end