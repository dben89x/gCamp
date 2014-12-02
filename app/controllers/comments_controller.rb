class CommentsController < ApplicationController
  before_action do
    @task = Task.find(params[:task_id])
  end

  def create
    @comment = @task.comments.new(params.require(:comment).permit(:text, :user_id, :task_id))
    @comment.user_id = current_user.id
    @comment.task_id = @task.id
    if @comment.save
      redirect_to project_task_path(@task.project_id, @task)
    else
      render 'tasks/show'
    end
  end
end
