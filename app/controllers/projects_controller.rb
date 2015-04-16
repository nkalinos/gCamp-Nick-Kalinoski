class ProjectsController <ApplicationController

  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate

  def authenticate
    redirect_to login_path, :alert => 'You need to be logged in to see this.' if not current_user
  end

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)


    if @project.save
      if @project.memberships.create(user: current_user, role: :owner)
        redirect_to project_tasks_path(@project), notice: 'Project was successfully created.'
      else
        render :new
        @project.destroy
        end
      end
    end

  def update

    if @project.update(project_params)

      redirect_to @project, notice: 'Project was successfully updated.'

    else
      render :edit
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def destroy
    @project.destroy
    redirect_to projects_url, notice: "Project successfully deleted!"
  end

  private
  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name)
  end
end
