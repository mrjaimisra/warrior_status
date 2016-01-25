require 'rails_helper'

RSpec.feature "Admin can visit add item page", type: :feature do
  before do
    login
  end

  scenario "successfully and click 'Cancel' to return to Store page" do
    visit store_path
    click_on "Add Item"

    expect(current_path).to eq(new_item_path)

    expect(page).to have_content("Title")
    expect(page).to have_content("Description")
    expect(page).to have_content("Price")
    expect(page).to have_button("Add Item")

    click_on "Cancel"
    expect(current_path).to eq(store_path)
  end
end
