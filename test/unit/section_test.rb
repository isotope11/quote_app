require 'minitest_helper'

class SectionTest < MiniTest::Rails::Model
  before do
    @section = Factory.build :section
  end

  it "must have a description" do
    @section.description = nil
    @section.valid?.must_equal false
  end

  it "must have an estimation" do
    @section.estimation = nil
    @section.valid?.must_equal false
  end

  it "must calculate estimation_min and estimation_max" do
    @section.estimation = 3
    @section.estimation_min.must_equal 2
    @section.estimation_max.must_equal 4
  end
end
