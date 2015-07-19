require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :category do
    sequence(:name) {|n| "Category #{n}"}
    total_printed 25
    description "Beautiful artwork series!"
  end

  factory :artwork do
    sequence(:title) { |n| "Artwork #{n}" }
    sequence(:number_in_series) { |n| n }
    photo "https://photourl.com"
    date "1964-08-23"
    category_id category
  end

end
