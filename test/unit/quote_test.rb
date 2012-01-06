require_relative '../test_helper'

describe Quote do
  before do
    @quote = Factory.build :quote
  end

  it "has a description" do
    @quote.description = "Foo"
    @quote.description.must_equal "Foo"
  end

  it "has sections" do
    @section = FactoryGirl.create :section, parent: @quote
    @quote.children.must_include @section
  end
end
