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
        "#{@membership.user.full_name} was added successfully to #{@membership.role}."
    else
      render :index
    end
  end

  def update
    if check_for_owner
      if @membership.update(membership_params)
        redirect_to project_memberships_path(@project, @membership), notice:
          "#{@membership.user.full_name} was updated successfully to #{@membership.role}."
      else
        render :index
      end
    else
      redirect_to project_memberships_path(@project), notice:
      "Must have at least one owner for the project."
    end
  end

  def destroy
    if check_for_owner
      @membership.destroy
      redirect_to project_memberships_path(@project), notice:
        "#{@membership.user.full_name} was removed successfully."
    else
      redirect_to project_memberships_path(@project), notice:
        "Cannot delete last owner of project."
    end
  end

  def check_for_owner
    has_owner = false
    @project.memberships.each do |member|
      if member.role == 'Owner' and member.id != @membership.id
        has_owner = true
      end
    end
    has_owner
  end

  def membership_params
    params.require(:membership).permit(:project_id, :user_id, :role)
  end

end
