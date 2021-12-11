# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :news_release do
    title { "Test news release" }
    released_on { 1.days.ago }
    body { Faker::Lorem.paragraph }

    factory :invalid_news_release do
      title { nil }
    end
  end
end
