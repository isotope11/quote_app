require_relative '../test_helper'

describe Quote do
  before do
    @quote = Factory.build :quote
  end

  it "has a title" do
    @quote.title = "Foo"
    @quote.title.must_equal "Foo"
  end

  it "has sections" do
    @section = FactoryGirl.create :section, quote: @quote
    @quote.sections.must_include @section
  end
end
