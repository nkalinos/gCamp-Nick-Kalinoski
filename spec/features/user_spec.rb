require "rails_helper"

  describe "Can create new user" do

    before :each do
        visit "/"
        click_on "Users"
        click_on "New User"
        fill_in "First name", with: "Nick"
        fill_in "Last name", with: "Kalinoski"
        fill_in "Email", with: "yogurtbrothers@gmail.com"
        click_on "Create User"
        first(:link, "Users").click
    end


    it 'can create a user' do
      expect(page).to have_content("Nick")
    end

    it "New user can view show page" do
      expect(page).to have_content("Nick")
    end

    it "Users can edit user" do
      click_on "Edit"
      fill_in "First name", with: "Nick"
      fill_in "Last name", with: "Kalinoski"
      fill_in "Email", with: "yogurtbrothers@gmail.com"
      click_on "Update User"
      expect(page).to have_content("Nick")
    end


end
