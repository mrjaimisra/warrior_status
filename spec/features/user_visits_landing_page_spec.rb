require 'rails_helper'

RSpec.feature "User can navigate to landing page", type: :feature do
  scenario "successfully" do
    visit root_path

    within 'nav' do
      expect(page).to have_content "Warrior Status"
      expect(page).to have_content "About"
    end
  end
end
