class UsersController < ApplicationController
  before_filter :require_no_user, only: [:new, :create]
  before_filter :require_user, :load_user, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user       = User.new(params[:user])
    @user.roles = Role.default_role

    if @user.save
      flash[:notice] = t(:account_created)
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = t(:account_updated)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def load_user
    @user = current_user
  end
end
