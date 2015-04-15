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


  end

  it 'user can sign in' do
    click_on "Sign out"
    click_on "Sign in"
    fill_in "Email", with: "yogurtbrothers@gmail.com"
    fill_in "Password", with: "jade09"
    within(".well") do
      click_on "Sign In"
    end
    expect(page).to have_content("Welcome back!")
  end
end
