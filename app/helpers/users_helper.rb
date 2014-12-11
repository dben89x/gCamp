module UsersHelper
  def fellow_member(user)
    users = []
    similar_members = []
    current_user.memberships.each {|membership|
      User.all.each {|u|
        similar_members += u.memberships.where(project_id: membership.project_id)
      }
    }
    similar_members.each {|member| users << User.find(member.user_id)}
    users = users.uniq

    if users.include?(user) or current_user.admin
      return true
    end
  end
end
