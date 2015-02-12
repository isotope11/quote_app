require_relative '../test_helper'

describe Section do
  before do
    @section = FactoryGirl.create :section
  end

  it "can have child sections" do
    subsection = FactoryGirl.create :section, parent: @section
    @section.children.must_include subsection
  end

  it "has a description" do
    @section.description.must_equal 'test description'
  end

  it "sums the min hours of its child elements" do
    FactoryGirl.create(:item, parent: @section, min_hours: 2)
    FactoryGirl.create(:item, parent: @section, min_hours: 3)
    @section.min_hours.must_equal 5
  end
end
