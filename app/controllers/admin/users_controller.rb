class Admin::UsersController < Admin::BaseController

  before_filter :load_user, only: [ :show, :edit, :update, :destroy, :search_device, :change_device, :remove_device ]

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
      flash[:success] = t('admin.users.created_user')
      redirect_to edit_admin_user_path(@user)
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
      flash[:success] = t('admin.users.updated_user')
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

  def search_device
    @search = Device.search(params[:search])
    @search.meta_sort ||= 'name.asc'

    @devices = @search.all

    respond_to do |format|
      format.js   do
        partial = 'admin/users/modal_search_device/modal_body'
        locals  = { search: @search, devices: @devices, user: @user }
        render partial: partial, locals: locals
      end
      format.html { render nothing: true }
    end
  end

  def remove_device
    if @user.update_attributes(device: nil)
      search_device
    end
  end

  def change_device
    if params[:device_id]
      @device = Device.find(params[:device_id])
    end

    if @user.update_attributes(device: @device)
      respond_to do |format|
        format.js   do
          partial = 'admin/users/modal_search_device/form_search_device_field'
          locals  = { user: @user }
          render partial: partial, locals: locals
        end
        format.html { render nothing: true }
      end
    end
  end

  private

  def load_user
    @user = User.find(params[:id])
  end
end
