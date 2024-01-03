FactoryBot.define do
  factory :cat do
    name  { Faker::DcComics.hero }
    token { Faker::Alphanumeric.alpha(number: 10) }

    factory :invalid_cat do
      name { nil }
    end
  end
end
