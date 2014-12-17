module ApplicationHelper
  def page_header(title, &block)
    content_for(:title, title)
    html = '<div class = "page-header">'.html_safe
    html += '<div class = "pull-right">'.html_safe
    if block
      html += capture do
        block.call
      end
    end
    html += '</div>'.html_safe
    html += '<h1>'.html_safe
    html += title
    html += '</h1>'.html_safe
    html += '</div>'.html_safe

    html
  end

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
