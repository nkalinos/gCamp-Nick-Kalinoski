class RegistrationsController <ApplicationController

  # before_action :set_registration, only: [:show, :edit, :update, :destroy]




  def new
    @registration = Registration.new
  end

  def create
    @registration = Registration.new(registration_params)


    if @registration.save

      redirect_to @registration, notice: 'Welcome!'
    else
      render :new
    end
  end



  def show
    @registraton = Registration.find(params[:id])

  end



  private
  def set_project
    @registration = Registration.find(params[:id])
  end

  def registration_params
    params.require(:project).permit(:name)
  end
end
