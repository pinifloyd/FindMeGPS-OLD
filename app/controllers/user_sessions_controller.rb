class UserSessionsController < ApplicationController
  before_filter :require_no_user, only: [:new, :create]
  before_filter :require_user, only: :destroy

  def new
    @user_session = UserSession.new
    flash[:error] = nil
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = t(:login)
      redirect_to root_path
    else
      flash[:error] = t(:user_session_error)
      render :new
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = t(:logout)
    redirect_to root_path
  end
end
