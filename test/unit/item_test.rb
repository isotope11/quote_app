require 'minitest_helper'

class ItemTest < MiniTest::Rails::Model
  before do
    @item = Factory :item
  end

  it "belongs to a section" do
    section = Factory :section
    @item.section = section
    @item.section.must_equal section
  end

  it "has a description" do
    @item.description.must_equal 'test description'
  end

  it "has an estimation" do
    @item.estimation.must_equal 2.5
  end

  it "has a min and max calculated estimate" do
    @item.estimation_min.must_equal 1.5
    @item.estimation_max.must_equal 3.5
  end
end
