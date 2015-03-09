class MembershipsController < ApplicationController

  def index
    @memberships = Membership.all
    @project = Project.find(params[:project_id])
    @membership = @project.memberships.new
  end
  

end
