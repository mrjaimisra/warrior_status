require 'rails_helper'

RSpec.feature "An Admin can", type: :feature do
  let!(:admin) { Admin.create(username: "Admin", password: "password") }

  scenario "successfully navigate to and from the new Items page" do
    login
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

  scenario "not see the new Items page if not logged in" do
    visit new_item_path
    expect(current_path).to eq(root_path)

    visit store_path
    expect(page).to_not have_link("Add Item")
  end
end
