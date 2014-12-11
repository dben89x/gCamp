module ApplicationHelper
  def valid_owner
    valid_user = false
    if @project.users.include?(current_user) or current_user.admin
      if current_user.admin or @project.memberships.find_by_user_id(current_user.id).role == 'Owner'
        valid_user = true
      end
    end
    valid_user
  end
end
