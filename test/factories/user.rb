FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "User #{n}" } 
    sequence(:email) { |n| "user#{n}@example.com" } 
    sequence(:password) { |n| "passwd#{n}" }
    password_confirmation { password }
  end
end