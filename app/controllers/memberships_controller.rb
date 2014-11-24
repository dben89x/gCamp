class MembershipsController < ApplicationController

  before_action do
    @project = Project.find(params[:project_id])
  end

  def set_membership
    @membership = @project.memberships.find(params[:id])
  end

  before_action :set_membership, only: [:update, :destroy]

  def index
    @memberships = @project.memberships
    @membership = Membership.new
  end

  def create
    @membership = @project.memberships.new(membership_params)

    if @membership.save
      redirect_to project_memberships_path(@project), notice:
        "#{@membership.user.full_name} was added successfully to #{@membership.status}."
    else
      render :index
    end
  end

  def update
    if @membership.update(membership_params)
      redirect_to project_memberships_path(@project, @membership), notice:
        "#{@membership.user.full_name} was updated successfully to #{@membership.status}."
    else
      render :index
    end
  end

  def destroy
    @membership.destroy
    redirect_to project_memberships_path(@project), notice:
      "#{@membership.user.full_name} was removed successfully."
  end

  def membership_params
    params.require(:membership).permit(:project_id, :user_id, :status)
  end

end
