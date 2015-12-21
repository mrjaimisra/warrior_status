require 'rails_helper'

RSpec.feature "Admin can log in", type: :feature do
  let!(:admin) { Admin.create(username: "Admin", password: "password") }

  scenario "successfully" do

    visit admin_path
    fill_in "Username", with: admin.username
    fill_in "Password", with: admin.password
    click_on "Login"

    expect(current_path).to eq dashboard_path
    expect(page).to have_content "Admin Dashboard"
  end
end
