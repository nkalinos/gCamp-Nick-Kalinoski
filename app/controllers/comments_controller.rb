class CommentsController < ApplicationController


  def new
    @task = Task.find_by(parmas[:task_id])
    @comment = Comment.new
  end

  def create
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:task_id])
    @user= current_user
    @comment = @task.comments.new(comment_params)
    @comment.user_id = @user.id
    if @comment.save
      redirect_to project_task_path(@project, @task)
    else
      render :new
    end
  end



  private
  def comment_params
    params.require(:comment).permit(:message, :task_id, :user_id )
  end
end
