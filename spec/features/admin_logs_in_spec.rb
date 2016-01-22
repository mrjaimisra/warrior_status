require 'rails_helper'

RSpec.feature "Admin can log in", type: :feature do
  let!(:admin) { Admin.create(username: "Admin", password: "password") }

  before do
    login
  end

  scenario "successfully" do
    expect(current_path).to eq root_path
    expect(page).to have_content "Logout"
  end
end
