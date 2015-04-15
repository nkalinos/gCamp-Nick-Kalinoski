require 'rails_helper'

  describe "Can create new project task" do

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


        fill_in "Name", with: "Pokemon"
        click_on "Create Project"
        first(:link, "Projects").click
    end



    it 'can create a project' do
      expect(page).to have_content("Pokemon")
    end

    it "New user can view show page" do
      expect(page).to have_content("Pokemon")
    end

    it "Users can edit project" do
      click_on "Edit"
      fill_in "Name", with: "Pokemon"
      click_on "Update Project"
      expect(page).to have_content("Pokemon")
    end


end
