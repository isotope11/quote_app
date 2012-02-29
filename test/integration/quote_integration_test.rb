require_relative '../test_helper'

describe "Quote integration" do
  before do
    User.find_or_create_by_email "user@example.com", password: "secretpass", password_confirmation: "secretpass"
    login_as "user@example.com", "secretpass"
    @quote = FactoryGirl.create :quote
    @section = FactoryGirl.create :section, parent: @quote
    @item_template = FactoryGirl.create :item_template
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
    click_link 'Add Section'
    fill_in 'Description', with: 'Engineering'
    click_button 'Create Section'
    current_path.must_equal quote_path @quote
    page.must_have_content 'Engineering'
  end

  it "has a workflow for creating items" do
    visit quote_path @quote
    within '.section' do
      click_link '+i'
    end
    click_link 'Data Model'
    fill_in 'Description', with: 'application modeling'
    fill_in 'Min hours', with: '4'
    fill_in 'Max hours', with: '8'
    click_button 'Create Item'
    current_path.must_equal quote_path @quote
    page.must_have_content 'application modeling'
  end
end

