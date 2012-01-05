require_relative '../test_helper'

describe "Quote integration" do
  before do
    @quote = Factory :quote
    @section = Factory :section, quote: @quote
  end

  it "should show the quote" do
    visit quotes_path
    page.must_have_content 'acme'
  end

  it "should show sub-sections" do
    visit quote_path(@quote)
    page.must_have_content @section.description
  end
end

