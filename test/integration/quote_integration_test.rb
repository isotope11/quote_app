require_relative '../test_helper'

describe "Quote integration" do
  before do
    @quote = Factory :quote
  end

  it "should show the quote" do
    visit quotes_path
    page.must_have_content 'acme'
  end
end

