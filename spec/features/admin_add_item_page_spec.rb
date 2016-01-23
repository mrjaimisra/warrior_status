require 'rails_helper'

RSpec.feature "Admin can view add item page", type: :feature do
  scenario "successfully" do
    login
    visit store_path
    click_on "Add Item"

    expect(current_path).to eq(new_item_path)

    expect(page).to have_content("Title")
    expect(page).to have_content("Description")
    expect(page).to have_content("Price")
    expect(page).to have_content("Image")
    expect(page).to have_button("Add Item")
  end
end
