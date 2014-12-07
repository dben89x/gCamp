class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :destroy, :update]

  def index
    if current_user.admin
      @projects = Project.all
    else
      user_projects = []
      current_user.memberships.each do |m|
        user_projects.push m.project_id
      end
      @projects = Project.where(id: user_projects)
    end
  end

  def show
  end

  def new
    @project = Project.new
    @new_page = true
  end

  def edit
    @edit_page = true
  end

  def create
    @project = Project.new(project_params)
    @project.memberships.new(
      user: current_user,
      role: 'owner'
    )
    if @project.save
      redirect_to project_tasks_path(@project), notice: 'Project was successfully created'
    else
      render :new
    end
  end

  def update
    validate(@project)
    if @project.update(project_params)
      redirect_to project_path(params[:id]), notice: 'Project was successfully updated'
    else
      render :edit
    end
  end

  def destroy
    validate(@project)
    @project.destroy
    redirect_to projects_path, notice: 'Project was successfully destroyed'
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name)
  end



end
