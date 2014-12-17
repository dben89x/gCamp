class MembershipsController < ApplicationController

  before_action {@project = Project.find(params[:project_id])}
  before_action :set_membership, :check_for_owner, only: [:update, :destroy]

  def index
    @memberships = @project.memberships
    @membership = Membership.new
  end

  def create
    @membership = @project.memberships.new(membership_params)

    if @membership.save
      redirect_to project_memberships_path(@project), notice:
        "#{@membership.user.full_name} was added successfully to #{@membership.role}."
    else
      render :index
    end
  end

  def update
    if @membership.update(membership_params)
      redirect_to project_memberships_path(@project, @membership), notice:
        "#{@membership.user.full_name} was updated successfully to #{@membership.role}."
    else
      render :index
    end
  end

  def destroy
    @membership.destroy
    redirect_to project_memberships_path(@project), notice:
      "#{@membership.user.full_name} was removed successfully."
  end

  private
  
  def check_for_owner
    has_owner = false
    @project.memberships.each do |member|
      if member.role == 'Owner' and member.id != @membership.id
        has_owner = true
      end
    end
    unless has_owner
      redirect_to project_memberships_path(@project)
      flash[:alert] = "Cannot delete last owner of project."
    end
  end

  def membership_params
    params.require(:membership).permit(:project_id, :user_id, :role)
  end

  def set_membership
    @membership = @project.memberships.find(params[:id])
  end

end
