require 'rails_helper'

RSpec.feature "Creating a new game" do
  scenario "shows a new game code after electing to host" do
    visit '/'
    within("#host") do
      click_on "Host Game"
    end

    expect(page).to have_content("Your game code is: ")
    expect(page).to have_link("See your codenames.")
  end
end
