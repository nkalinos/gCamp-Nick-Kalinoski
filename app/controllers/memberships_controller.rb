class MembershipsController < ApplicationController

  def index
    @memberships = Membership.all
    @project = Project.find(params[:project_id])
    @membership = Membership.new
  end

  def new
    @membership = Membership.new
    @project = Project.find(params[:project_id])
  end

  def create
    @project = Project.find(params[:project_id])
    @membership = Membership.new
    @membership.user_id = membership_params[:user_id]
    @membership.role = membership_params[:role].to_i
    @membership.project_id = @project.id
    if @membership.save
     redirect_to project_memberships_path(@project), notice: "#{@membership.user.full_name} was successfully added."
    else
      render :index
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @membership = Membership.find(params[:id])
     if @membership.destroy
       redirect_to project_memberships_path(@project), notice: "#{@membership.user.full_name} was successfully destroyed"
     end
   end

   def update
     @project = Project.find(params[:project_id])
     @membership = Membership.find(params[:id])
       if @membership.update(project)
       redirect_to project_memberships_path(@project), notice: "#{@membership.user.full_name} was successfully updated"
     end
   end


  private

  def membership_params
    params.require(:membership).permit(:user_id, :project_id, :role)
  end

end
