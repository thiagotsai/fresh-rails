require 'rails_helper'

describe "Manage user account" do
  before do
    Capybara.app_host = 'localhost:3000'
    Capybara.run_server = false
    Capybara.default_driver = :selenium
  end

  it "allows user to sign up with email" do
    visit "/"
    click_link "Sign up"
    expect(page).to have_content "Sign up with email"
    click_link "Sign up with email"
    expect(page).to have_content "Email" and "Password"
    fill_in "Email", with: "test@test.com"
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123456"
    click_button "Sign up"
    expect(page).to have_content "You have signed up successfully"
  end

  it "allows user to login with email and logout" do
    # login
    visit "/"
    click_link "Login"
    expect(page).to have_content "Log in with Facebook"
    fill_in "Email", with: "test@test.com"
    fill_in "Password", with: "123456"
    click_button "Log in"
    expect(page).to have_content "Signed in successfully"
    # lougout
    find('img#navbar-wagon-menu').click
    click_link "Log out"
    expect(page).to have_content "Signed out successfully"
  end

  it "allows user cancel the account" do
    # login
    visit "/"
    click_link "Login"
    expect(page).to have_content "Log in with Facebook"
    fill_in "Email", with: "test@test.com"
    fill_in "Password", with: "123456"
    click_button "Log in"
    expect(page).to have_content "Signed in successfully"
    # cancel the account
    find('img#navbar-wagon-menu').click
    click_link "Profile"
    expect(page).to have_content "Edit User"
    click_link "Cancel my account"
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content "Your account has been successfully cancelled"
  end

end
