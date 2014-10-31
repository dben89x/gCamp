class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :destroy, :update]

  def index
    @projects = Project.all
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
    @project.save
    redirect_to project_path(@project), notice: 'Project was successfully created'
  end

  def destroy
    @project.destroy
    redirect_to projects_path, notice: 'Project was successfully destroyed'
  end

  def update
    @project.update(project_params)
    redirect_to project_path(params[:id]), notice: 'Project was successfully updated'
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name)
  end

end
