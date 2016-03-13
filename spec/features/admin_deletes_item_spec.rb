require 'rails_helper'

RSpec.feature "Admin can", type: :feature do
  let!(:admin)    { Admin.create(username: "Admin", password: "password") }
  let!(:category) { Category.create(name: "Accessories") }
  let!(:item)     { Item.create(title:       "My First Piece",
                                description: "Something to be replaced",
                                price:       1,
                                category_id: category.id,
                                item_image_file_name: "sun-rose-feather.jpg",
                                item_image_content_type: "image/jpeg",
                                item_image_file_size: 209772,
                                item_image_updated_at: Date.new ) }

  before do
    login
  end

  scenario "successfully delete an existing item" do
    visit item_path(item)
    click_on "Delete Item"

    expect(current_path).to eq(store_path)
    expect(page).to_not have_content(item.title)
    expect(page).to_not have_content(item.description)
  end
end
