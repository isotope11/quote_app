FactoryGirl.define do
  factory :section do
    description 'test description'
    estimation 2.5
  end

  factory :item do
    description 'test description'
    estimation 2.5
    section { Section.first || FactoryGirl.create(:section) }
  end

  factory :quote do
    title 'acme'
  end
end

