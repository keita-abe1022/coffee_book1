FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "test_user_#{n}" }
    sequence(:email) { |n| "test_user_#{n}@example.com" }
    password { "foobar1234" }
    password_confirmation { "foobar1234" }
  end
end
