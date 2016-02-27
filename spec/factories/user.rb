FactoryGirl.define do
  factory :user do
    profile

    email    { Faker::Internet.email }
    password { '111111' }
  end
end
