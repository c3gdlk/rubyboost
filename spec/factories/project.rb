FactoryGirl.define do
  factory :project do
    sequence(:title)  { |n| "Project-#{n}" }
    active { true }
  end
end
