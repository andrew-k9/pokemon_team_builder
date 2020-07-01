module ApplicationHelper
  def logged_in?(user)
    session.key?(:user_id) && session[:user_id] == user.id
  end

  def current_user
    User.find(session[:user_id])
  end
end
