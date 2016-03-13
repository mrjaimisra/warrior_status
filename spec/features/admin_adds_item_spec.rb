require 'rails_helper'

RSpec.feature "Admin can", type: :feature do
  let!(:admin) { Admin.create(username: "Admin", password: "password") }
  let!(:admin)           { Admin.create(username: "Admin",
                                        password: "password") }
  let!(:first_category)  { Category.create(name: "Accessories") }
  let!(:second_category) { Category.create(name: "Apparel") }
  let!(:item)            { Item.create(title: "My First Piece",
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

  scenario "successfully add a new item" do
    visit new_item_path
    expect(current_path).to eq(new_item_path)

    fill_in "Title",       with: "My First Item"
    fill_in "Description", with: "A great piece"
    fill_in "Price",       with: 8
    select "Accessories",  from: "item[category_id]"
    attach_file "item_item_image",  File.expand_path('./app/assets/images/purple-parfletche-earrings.jpg')

    click_on "Add Item"
    new_item = Item.last

    expect(current_path).to eq(item_path(new_item))
    expect(page).to have_content("My First Item")
    expect(page).to have_content("A great piece")

    visit(item_path(new_item))

    within(".item-info-box") do
      expect(page).to have_content(8)
      expect(page).to have_content("Accessories")
    end
  end

  scenario "not add a new item form fields are blank" do
    visit new_item_path

    click_on "Add Item"

    expect(current_path).to eq(items_path)
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Description can't be blank")
    expect(page).to have_content("Price can't be blank")
    expect(page).to have_content("Item image can't be blank")
  end

  scenario "not add a new item if information is improperly formatted" do
    visit new_item_path

    fill_in "Title",          with: "My First Item"
    fill_in "Description",    with: "A great piece"
    fill_in "Price",          with: "eight"
    attach_file "item_item_image", File.expand_path('./app/assets/images/purple-parfletche-earrings.pdf')

    click_on "Add Item"

    expect(current_path).to eq(items_path)
    expect(page).to have_content("Price is not a number")
    expect(page).to have_content("Item image content type is invalid")
  end
end
