class MapsController < ApplicationController

  layout 'application_fluid'

  def show
    @devices = Device.all
  end

end
