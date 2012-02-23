class Admin::DevicesController < Admin::BaseController

  before_filter :load_device, only: [ :show, :edit, :update, :destroy ]

  def index
    @devices = Device.all
  end

  def show; end

  def new
    @device = Device.new
  end

  def create
    @device = Device.new(params[:device])

    if @device.save
      redirect_to admin_devices_path
    else
      render action: :new
    end
  end

  def edit; end

  def update
    if @device.update_attributes(params[:device])
      redirect_to admin_devices_path
    else
      render action: :edit
    end
  end

  def destroy
    if @device.destroy
      respond_to do |format|
        format.js   { render nothing: true }
        format.html { redirect_to admin_devices_path }
      end
    end
  end

  private

  def load_device
    @device = Device.find(params[:id])
  end

end
