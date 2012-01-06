require_relative '../test_helper'

describe Section do
  before do
    @section = Factory.build :section
  end

  it "can have child sections" do
    subsection = Factory :section, parent: @section
    @section.children.must_include subsection
  end

  it "has a description" do
    @section.description.must_equal 'test description'
  end

  it "sums the min hours of its child elements" do
    Factory(:item, parent: @section, min_hours: 2)
    Factory(:item, parent: @section, min_hours: 3)
    @section.min_hours.must_equal 5
  end
end
