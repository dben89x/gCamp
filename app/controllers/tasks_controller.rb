class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.where(complete: false)
    p (request.url)
if URI.parse(request.url).query
p @query
  p "stuff"
    if params[:filter] == "all"
      @tasks = Task.all
    elsif params[:sort_by] == "description"
      @tasks = Task.all.sort_by { |task| task.description.downcase }
    elsif params[:sort_by] == "due_date"
      @tasks = Task.order(due_date: :desc)
    elsif params[:sort_by] == "complete"
      @tasks = Task.order(:complete)
    end
  end
end
  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @show_page = true
  end

  # GET /tasks/new
  def new
    @new_page = true
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
    @edit_page = true
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task), notice: 'Task was successfully created.'
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    @task.update(task_params)
    redirect_to task_path(@task), notice: 'Task was successfully updated.'
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    redirect_to tasks_path, notice: 'Task was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:description, :complete, :due_date)
    end
end
