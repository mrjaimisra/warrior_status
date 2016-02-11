require 'rails_helper'

RSpec.feature "User can remove item in cart", type: :feature do
  let!(:item) { Item.create(title:       "My First Piece",
                            description: "Description",
                            price:       1,
                            item_image_file_name: "sun-rose-feather.jpg",
                            item_image_content_type: "image/jpeg",
                            item_image_file_size: 209772,
                            item_image_updated_at: Date.new ) }

  scenario "successfully" do
    visit store_path
    expect(page).to have_content(item.title)

    visit item_path(item)
    click_button "Add to cart"

    expect(current_path).to eq(store_path)
    click_link "Cart"

    expect(page).to have_content(item.title)
    fill_in "quantity", with: "2"
    click_on "Update"

    expect(current_path).to eq(cart_path)
    expect(page).to have_content(item.title)
    expect(page).to have_content("2")
  end
end