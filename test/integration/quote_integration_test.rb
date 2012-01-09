require_relative '../test_helper'

describe "Quote integration" do
  before do
    @quote = FactoryGirl.create :quote
    @section = FactoryGirl.create :section, parent: @quote
  end

  it "should show the quote" do
    visit quotes_path
    page.must_have_content 'acme'
  end

  it "should show sub-sections" do
    visit quote_path(@quote)
    page.must_have_content @section.description
  end

  it "has a workflow for creating toplevel sections" do
    visit quote_path @quote
    within 'h3' do
      click_link 'edit'
    end
    click_link 'New Section'
    fill_in 'Description', with: 'Engineering'
    click_button 'Create Section'
    current_path.must_equal quote_path @quote
    page.must_have_content 'Engineering'
  end

  it "has a workflow for creating items" do
    visit quote_path @quote
    within '.section' do
      click_link 'edit'
    end
    click_link 'New Child Item'
    fill_in 'Description', with: 'application modeling'
    fill_in 'Min hours', with: '4'
    fill_in 'Max hours', with: '8'
    click_button 'Create Item'
    current_path.must_equal quote_path @quote
    page.must_have_content 'application modeling'
  end
end

