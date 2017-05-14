FactoryGirl.define do
  factory :user do
    email { Faker::Internet.free_email }
    password { '12341234' }
  end
end
