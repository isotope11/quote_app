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

  it "has an estimation" do
    @section.estimation.must_equal 2.5
  end

  it "has a min and max calculated estimate" do
    @section.estimation_min.must_equal 1.5
    @section.estimation_max.must_equal 3.5
  end
end
