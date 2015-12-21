require 'rails_helper'

RSpec.feature "Admin can log out", type: :feature do
  let!(:admin) { Admin.create(username: "Admin", password: "password") }

  before do
    login
  end

  scenario "successfully" do
    expect(current_path).to eq root_path

    click_on "Logout"

    expect(current_path).to eq root_path
    expect(page).not_to have_content "Edit Profile"
    expect(page).not_to have_content "Logout"
  end
end
