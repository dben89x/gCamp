module ApplicationHelper
  def valid_owner
    valid_user = false
    if @project.users.include?(current_user)
      if current_user.admin or @project.memberships.find_by_user_id(current_user.id).role == 'Owner'
        valid_user = true
      end
    end
    valid_user
  end

  def hide_current_page_link(path, link)
    unless current_page?("/#{path}")
      content_tag :a, :href=>"/#{path}" do
        link 
      end
    end
  end
end
