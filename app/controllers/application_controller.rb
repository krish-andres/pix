class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def require_signin
    unless current_user
      session[:intended_url] = request.url
      redirect_to signin_url, alert: "Please sign in first!"
    end  
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def current_user?(user)
    current_user == user
  end
  helper_method :current_user?
  
  def is_group_admin?(user, group)
    user.user_groups.find_by(group: group).admin == true
  end
  helper_method :is_group_admin?

  def album_creator?(album, user)
    user == album.user
  end
  helper_method :album_creator?

end
