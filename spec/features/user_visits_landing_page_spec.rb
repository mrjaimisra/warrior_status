require 'rails_helper'

RSpec.feature "User can navigate to landing page", type: :feature do
  scenario "successfully" do
    visit root_path

    expect(page).to have_content "Warrior Status"
    expect(page).to have_css     "img[src*='rottingbuffalo']"
    expect(page).to have_content "Mission Statement"
  end
end
