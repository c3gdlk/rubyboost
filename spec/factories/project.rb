FactoryGirl.define do
  factory :project do
    user

    sequence(:title)  { |n| "Project-#{n}" }
    active { true }
  end
end
