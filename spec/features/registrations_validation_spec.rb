require 'rails_helper'

describe "Can create new user" do

  before :each do
    visit '/'
    click_on 'Sign Up'
    fill_in "First name", with: "Nick"
    fill_in "Last name", with: "Kalinoski"
    fill_in "Password", with: "jade09"
    fill_in "Password confirmation", with: "jade09"
    within(".well") do
      click_on "Sign Up"
    end
  end

  it 'cannot leave email blank' do
    expect(page).to have_content("Email can't be blank")
  end
end
