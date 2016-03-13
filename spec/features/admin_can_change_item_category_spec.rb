require 'rails_helper'

RSpec.feature "Admin can", type: :feature do
  let!(:admin) { Admin.create(username: "Admin", password: "password") }
  let!(:first_category) { Category.create(name: "Accessories") }
  let!(:second_category) { Category.create(name: "Artwork") }
  let!(:item)  { Item.create(title:       "My First Piece",
                             description: "Something to be replaced",
                             price:       1,
                             category_id: first_category.id,
                             item_image_file_name: "sun-rose-feather.jpg",
                             item_image_content_type: "image/jpeg",
                             item_image_file_size: 209772,
                             item_image_updated_at: Date.new ) }

  before do
    login
  end

  scenario "move an item into a different category on the store page" do
    visit store_path

    within("##{first_category.name}-container") do
      expect(page).to have_content(item.title)
      expect(page).to have_content(item.description)
    end

    within("##{second_category.name}-container") do
      expect(page).to_not have_content(item.title)
      expect(page).to_not have_content(item.description)
    end

    click_on item.title
    expect(current_path).to eq(item_path(item))
    click_on "Edit Item"

    expect(current_path).to eq(edit_item_path(item))
    select "Artwork", from: "item[category_id]"

    click_on "Update"
    expect(current_path).to eq(item_path(item))
    visit store_path

    within("##{first_category.name}-container") do
      expect(page).to_not have_content(item.title)
      expect(page).to_not have_content(item.description)
    end

    within("##{second_category.name}-container") do
      expect(page).to have_content(item.title)
      expect(page).to have_content(item.description)
    end
  end
end
