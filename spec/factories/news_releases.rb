# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :news_release do
    title "MyString"
    released_on "2014-05-07"
    body "MyText"
  end
end
