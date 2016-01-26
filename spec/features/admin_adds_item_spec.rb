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
    attach_file "Item image",  File.expand_path('./app/assets/images/purple-parfletche-earrings.jpg')

    click_on "Add Item"

    expect(current_path).to eq(store_path)
    expect(page).to have_content("My First Item")
    expect(page).to have_content("A great piece")
  end

  scenario "unsuccessfully due to blank fields" do
    visit new_item_path

    click_on "Add Item"

    expect(current_path).to eq(items_path)
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Description can't be blank")
    expect(page).to have_content("Price can't be blank")
    expect(page).to have_content("Item image can't be blank")
  end

  scenario "unsuccessfully due to invalid entries" do
    visit new_item_path

    fill_in "Title",       with: "My First Item"
    fill_in "Description", with: "A great piece"
    fill_in "Price",       with: "eight"
    attach_file "Item image",  File.expand_path('./app/assets/images/purple-parfletche-earrings.pdf')

    click_on "Add Item"

    expect(current_path).to eq(items_path)
    expect(page).to have_content("Price is not a number")
    expect(page).to have_content("Item image content type is invalid")
  end


end
