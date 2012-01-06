FactoryGirl.define do
  factory :section do
    description 'test description'
  end

  factory :item do
    description 'test description'
    min_hours 2
    max_hours 4
    section { Section.first || FactoryGirl.create(:section) }
  end

  factory :quote do
    title 'acme'
  end
end

