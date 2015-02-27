require 'rails_helper'

  describe "Can create new project" do

    before :each do
        visit "/"
        click_on "Projects"
        click_on "Create Project"
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
