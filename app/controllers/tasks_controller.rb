class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks
    if params[:filter] == "all"
      @tasks = Task.all
    else
      @tasks = Task.where(complete: false)
    end

    # if params[:sort_by] == "description"
    # if params[:sort_by] == "description"
    #   @tasks = Task.all.sort_by { |task| task.description.downcase }
    if params[:sort_by] == "due_date"
      @tasks.order(due_date: :desc)
    elsif params[:sort_by] == "complete"
      @tasks.order(:complete)
    end
  end

  def show
    @show_page = true
  end

  def new
    @new_page = true
    @task = Task.new
  end

  def edit
    @edit_page = true
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_path(@task), notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to task_path(@task), notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: 'Task was successfully destroyed.'
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:description, :complete, :due_date)
    end
end
