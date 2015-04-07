class TasksController < ApplicationController
  # before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate
  def authenticate
    redirect_to login_path, :alert => 'You need to be logged in to see this.' if not current_user
  end


  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
    @project = Project.find(params[:project_id])
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])
    @project = Project.find(params[:project_id])
    @comment = Comment.new
    @user = @comment.user_id

  end

  # GET /tasks/new
  def new
    @task = Task.new
    @project = Project.find(params[:project_id])
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
    @project = Project.find(params[:project_id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @project = Project.find(params[:project_id])
    @task.project_id = params[:project_id]

    if @task.save
      redirect_to project_tasks_path(@project, @task ), notice: 'Task was successfully created.'
    else
      render :new
    end
  end


  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])
    @project = Project.find(params[:project_id])
    if @task.update(task_params)
      redirect_to project_task_path(@project, @task), notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @project = Project.find(params[:project_id])
    @task.destroy
    redirect_to project_tasks_url, notice: 'Task was successfully deleted.'

  end




  private
  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def task_params
    params.require(:task).permit(:description, :date, :box)
  end

end
