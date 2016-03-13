require 'rails_helper'

RSpec.feature "User can remove item in cart", type: :feature do
  let!(:category) { Category.create(name: "Accessories") }
  let!(:item) { Item.create(title:       "My First Piece",
                            description: "Description",
                            price:       1,
                            category_id: category.id,
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
    click_link "Remove"

    expect(current_path).to eq(cart_path)
    expect(page).to_not have_content(item.title)
  end
end
