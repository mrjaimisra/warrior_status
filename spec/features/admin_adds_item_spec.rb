require 'rails_helper'

RSpec.feature "Admin can add a new item", type: :feature do
  before do
    login
  end

  scenario "successfully" do
    visit new_item_path
    fill_in "Title",       with: "My First Item"
    fill_in "Description", with: "A great piece"
    fill_in "Price",       with: 8

    click_on "Add Item"

    expect(current_path).to eq(store_path)
    expect(page).to have_content("My First Item")
    expect(page).to have_content("A great piece")
  end
end
