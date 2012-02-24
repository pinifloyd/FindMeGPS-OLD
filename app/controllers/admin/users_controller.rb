class Admin::UsersController < Admin::BaseController

  before_filter :load_user, only: [ :show, :edit, :update, :destroy ]

  def index
    @users = User.all
  end

  def show; end

  def new
    @user  = User.new
    @roles = Role.all
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to admin_users_path
    else
      @roles = Role.all
      render action: :new
    end
  end

  def edit
    @roles = Role.all
  end

  def update
    if @user.update_attributes(params[:user])
      redirect_to admin_users_path
    else
      @roles = Role.all
      render action: :edit
    end
  end

  def destroy
    if @user.destroy
      respond_to do |format|
        format.js   { render nothing: true }
        format.html { redirect_to admin_users_path }
      end
    end
  end

  private

  def load_user
    @user = User.find(params[:id])
  end

end
