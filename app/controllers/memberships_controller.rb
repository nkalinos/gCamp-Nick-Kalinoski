class MembershipsController < ApplicationController
  before_action :set_project, :except => [:index, :new, :create]

  # before_action :set_owner, only: [:new, :create]

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
    @membership = Membership.new(membership_params)
    @membership.user_id = membership_params[:user_id]
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

       if @membership.update(membership_params)
       redirect_to project_memberships_path(@project), notice: "#{@membership.user.full_name} was successfully updated"
     end
   end


  private

  def set_project
   @project = Project.find(params[:project_id])
   unless @project && @project.users.include?(current_user)
     redirect_to projects_path, notice: 'You do not have access to that project.'
   end
  end

  def membership_params
    params.require(:membership).permit(:user_id, :project_id, :role)
  end

  def set_owner
      unless current_user.project_owner(@project)
        redirect_to project_path(@project), notice: 'You do not have access.'
      end
    end

end
