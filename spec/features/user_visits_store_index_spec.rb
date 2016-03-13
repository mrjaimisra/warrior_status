require 'rails_helper'

RSpec.feature "User can navigate to store page", type: :feature do
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
    visit root_path

    within('#nav-mobile') do
      click_on "Store"
    end

    expect(current_path).to eq(store_path)
    expect(page).to have_content(item.title)
  end
end
