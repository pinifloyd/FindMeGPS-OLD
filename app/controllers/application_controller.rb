class ApplicationController < ActionController::Base
  helper_method :current_user_session, :current_user

  protect_from_forgery

  private

  def current_user_session
    current_user_session ||= UserSession.find
  end

  def current_user
    current_user ||= current_user_session && current_user_session.user
  end

  def require_user
    unless current_user
      flash[:notice] = "You must be logged in to access this page!"
      redirect_to signin_path
      return false
    end
  end

  def require_no_user
    if current_user
      flash[:notice] = "You must be logged out to access this page!"
      redirect_to root_url
      return false
    end
  end
end
