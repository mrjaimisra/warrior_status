require 'rails_helper'

RSpec.feature "Admin can", type: :feature do
  let!(:admin) { Admin.create(username: "Admin", password: "password") }
  let!(:item)   { Item.create(title:       "My First Piece",
                              description: "Something to be replaced",
                              price:       1,
                              item_image_file_name: "sun-rose-feather.jpg",
                              item_image_content_type: "image/jpeg",
                              item_image_file_size: 209772,
                              item_image_updated_at: Date.new ) }

  before do
    login
  end

  scenario "successfully edit an existing item" do
    visit item_path(item)
    click_on "Edit Item"

    fill_in "Title",          with: "My Second Item"
    fill_in "Description",    with: "Best Piece Ever"
    fill_in "Price",          with: 7
    attach_file "Item image", File.expand_path('./app/assets/images/purple-parfletche-earrings.jpg')

    click_on "Update"

    expect(current_path).to eq(item_path(item))
    expect(page).to have_content("My Second Item")
    expect(page).to have_content("Best Piece Ever")
    expect(page).to_not have_content(item.title)
    expect(page).to_not have_content(item.description)
  end

  scenario "not edit an existing item if form fields are blank" do
    visit item_path(item)
    click_on "Edit Item"

    fill_in "Title",          with: ""
    fill_in "Description",    with: ""
    fill_in "Price",          with: ""
    # attach_file "Item image", ""

    click_on "Update"

    expect(current_path).to eq(item_path(item))
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Description can't be blank")
    expect(page).to have_content("Price can't be blank")
  end

  scenario "not edit an existing item if information is improperly formatted" do
    visit item_path(item)
    click_on "Edit Item"

    fill_in "Price",          with: "eight"
    attach_file "Item image", File.expand_path('./app/assets/images/purple-parfletche-earrings.pdf')

    click_on "Update"

    expect(current_path).to eq(item_path(item))
    expect(page).to have_content("Price is not a number")
    expect(page).to have_content("Item image content type is invalid")
  end
end
