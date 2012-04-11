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
      flash[:success] = t('user_session.login')
      redirect_to root_path
    else
      flash[:error] = t('user_session.error')
      render :new
    end
  end

  def destroy
    current_user_session.destroy
    flash[:success] = t('user_session.logout')
    redirect_to root_path
  end
end
