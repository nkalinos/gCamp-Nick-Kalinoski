require 'rails_helper'

  describe "User can CRUD tasks" do

    before :each do
        visit "/"
        click_on "Tasks"
        click_on "New Task"
        fill_in "Description", with: "asf"
        click_on "Create Task"
        first(:link, "Tasks").click
    end


    it 'Users can create a task' do
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
