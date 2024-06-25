FactoryBot.define do
  factory :photo do
    user { nil }
    image { "MyString" }
    caption { "MyText" }
  end
end
