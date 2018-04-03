require 'rails_helper'

describe "Find Dishes Nearby" do
  before do
    Capybara.app_host = 'localhost:3000'
    Capybara.run_server = false
    Capybara.default_driver = :selenium
  end

  it "allows user to click on find at homepage" do
    visit "/"
    click_button value: "Find it nearby"
    expect(page).to have_content "We found" or "No matches for your search"
  end

end
