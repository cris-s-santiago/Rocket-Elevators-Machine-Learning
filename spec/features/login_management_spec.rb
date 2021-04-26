require "rails_helper"

RSpec.feature "Login management", :type => :feature do
  scenario "User logs in as admin" do
    visit "/users/sign_in"

    fill_in "Email", :with => "admin@admin"
    fill_in "Password", :with => "123456"
    click_button "Log in"

    expect(page).to have_text("Back Office")
  end

  scenario "User logs in as user" do
    visit "/users/sign_in"

    fill_in "Email", :with => "test@test"
    fill_in "Password", :with => "123456"
    click_button "Log in"

    expect(page).to_not have_text("Back Office")
  end
end