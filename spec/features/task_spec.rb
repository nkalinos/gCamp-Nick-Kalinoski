require 'rails_helper'

  describe "User can CRUD tasks" do

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

    it 'can sign up' do
      expect(page).to have_content("User Successfully Created!")
    end

    it "can create a project" do
        fill_in "Name", with: " "
        click_on "Create Project"
        expect(page).to have_content("Name can't be blank")
        fill_in "Name", with: "Pokemon"
        click_on "Create Project"
        expect(page).to have_content("Pokemon")
        end



    it 'Users can create a task' do
    click_on "Tasks"
    click_on "New Task"
    fill_in "Description", with: "asf"
    click_on "Create Task"
    expect(page).to have_content("asf")
end


    it "Users can view show page of task" do
      expect(page).to have_content("asf")
    end

    it "Users can edit task" do
      click_on "Edit"
      fill_in "Description", with: "fdsafds"
      click_on "Update Task"
      expect(page).to have_content("fdsafds")
    end


end
