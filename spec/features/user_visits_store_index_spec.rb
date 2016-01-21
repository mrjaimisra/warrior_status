require 'rails_helper'

RSpec.feature "User can navigate to landing page", type: :feature do
  let!(:item) { Item.create(title: "My First Piece") }

  scenario "successfully" do
    visit root_path
    click_on "Store"

    expect(current_path).to eq(store_path)
    expect(page).to have_content(item.title)
  end
end
