class MembershipsController <ApplicationController

  def index
    @memberships = Membership.all
  end

  def new
    @membership = Membership.new
  end

  def create
    @membership = Membership.new(membership_params)
    if @membership.save

      redirect_to @project, notice: 'Membership was successfully created.'
    else
      render :new
    end
  end

  def show
    @membership = Membership.find(params[:id])
  end


  private
  def membership_params
    params.require(:membership).permit(:project_id, :user_id, :boolean)
  end

end
