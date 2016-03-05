FactoryGirl.define do
  factory :article do
    project

    sequence(:title) { |n| "Article - #{n}" }
    content          { Faker::Lorem.paragraphs(3) }
  end
end
