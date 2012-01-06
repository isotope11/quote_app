require_relative '../test_helper'

describe Item do
  before do
    @item = Factory :item
  end

  it "must have a parent section" do
    section = Factory :section
    @item.parent = section
    @item.parent.must_equal section
  end

  it "has a description" do
    @item.description.must_equal 'test description'
  end

  it "has min hours" do
    @item.min_hours = 2
    @item.min_hours.must_equal 2
  end

  it "has max hours" do
    @item.max_hours = 2
    @item.max_hours.must_equal 2
  end
end
