require 'rails_helper'

describe "Guest can Sign Up successfully" do

  before :each do
    visit '/'
    click_on "Sign Up"
    fill_in "First name", with: "Nick"
    fill_in "Last name", with: "Kalinoski"
    fill_in "Email", with: "yogurtbrothers@gmail.com"
    fill_in "Password", with: "jade09"
    fill_in "Password confirmation", with: "jade09"

    within(".well") do
      click_on "Sign Up"
    end

    click_on "Sign in"
    fill_in "Email", with: "yogurtbrothers@gmail.com"
    fill_in "Password", with: "jade09"

    within(".well") do
      click_on "Sign In"
    end
  end

    it "user can sign out" do
      click_on "Sign out"
      expect(page).to have_content("Bye!")
    end
  end
