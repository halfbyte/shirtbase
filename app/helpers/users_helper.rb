module UsersHelper
  def user_link(user)
    link_to user.nickname, user_shirts_path(user)
  end
  
end
