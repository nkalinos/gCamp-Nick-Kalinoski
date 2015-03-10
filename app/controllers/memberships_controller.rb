class MembershipsController < ApplicationController

  def index
    @project = Project.find(params[:project_id])
    @memberships = @project.memberships
    @users = User.all
    @roles = Role.all
  end



end
