FactoryGirl.define do
  factory :user do
    name "Jordan Byron"
    sequence(:email) { |n| "person#{n}@example.com" }
    after(:build) do |u|
      u.password_confirmation = u.password = "1234567890abcdefg"
    end
  end

  factory :recipe do
    name "My new recipe"
    ingredients "- Salt\n-Pepper\n-Garlic"
    directions  "1. Mix together\n2. Enjoy!"
    tag_list    "gf, paleo, dinner"
    user
  end
end
