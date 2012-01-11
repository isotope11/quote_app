require_relative '../test_helper'

describe ItemTemplate do
  before do
    @item_template = FactoryGirl.build :item_template
  end

  it 'has a description' do
    @item_template.description = 'Data Model'
    @item_template.description.must_equal 'Data Model'
  end

  it 'has min hours' do
    @item_template.min_hours = 2
    @item_template.min_hours.must_equal 2
  end

  it 'has max hours' do
    @item_template.max_hours = 2
    @item_template.max_hours.must_equal 2
  end
end
