require 'minitest_helper'

class SectionTest < MiniTest::Rails::Model
  before do
    @section = Factory.build :section
  end

  it "can be a subsection of another section" do
    supersection = Factory.build :section
    @section.section = supersection
    @section.section.must_equal supersection
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
