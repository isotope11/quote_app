require 'factory_girl'

FactoryGirl.define do
  factory :user do
    email 'user@example.com'
    password 'password'
    password_confirmation 'password'
  end

  factory :section do
    description 'test description'
  end

  factory :item do
    description 'test description'
    min_hours 2
    max_hours 4
    parent { Section.first || FactoryGirl.create(:section) }
  end

  factory :quote do
    description 'acme'
  end

  factory :item_template do
    description 'Data Model'
    min_hours 2
    max_hours 4
  end
end

