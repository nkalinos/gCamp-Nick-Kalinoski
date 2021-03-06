class UsersController < ApplicationController
  # before_filter :authorize
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :comembers
  before_filter :authenticate


  def index
    @users = User.all
  end

  def show
   @user = User.find(params[:id])

  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
    unless current_user == @user || admin_user
      render file: "/public/404.html",
      :status => 404, :layout => false
    end
  end

  def create
    @user = User.new(user_params)

      if @user.save
       redirect_to users_path, notice: 'User was successfully created.'
      else
         render :new
      end
    end


    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to users_path, notice: 'User was successfully updated.'
      else
        render :edit
      end
    end


    def destroy
      @user.destroy

        redirect_to users_url, notice: 'User was successfully deleted.'
      end

      private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
      params.require(:user).permit(:first_name, :last_name, :email, :password, :admin)
    end

    def comembers
      @comembers = current_user.projects.flat_map {|project| project.users}
    end


end
