require 'rails_helper'

RSpec.feature "User visits about page", type: :feature do
  scenario "successfully" do
    visit root_path

    within('#nav-mobile') do
      click_on "About"
    end

    expect(current_path).to eq about_path
    expect(page).to have_content "is a fashion concept, trademark business focused on empowering Native youth"
  end
end
