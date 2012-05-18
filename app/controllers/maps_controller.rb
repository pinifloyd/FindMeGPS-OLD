class MapsController < ApplicationController

  layout 'application_fluid'

  before_filter :check_devices, only: :generate_kml

  def show
    @devices = Device.all
  end

  def generate_kml
    file = File.open('/Users/sergey/Dropbox/Public/FIndMeGPS/find_me_gps.kml', 'w')

    xml = Builder::XmlMarkup.new(target: file, indent: 2)
    xml.instruct!
    xml.kml(xmlns: "http://earth.google.com/kml/2.2") do
      xml.Document do

        # Points - need to extract to other method
        # @devices.each do |device|
        #   device.device_locations.each do |location|
        #     xml.Placemark do
        #       xml.name device.name
        #       xml.description do
        #         xml.cdata! device.number.to_s
        #       end
        #       xml.Point do
        #         xml.coordinates [ location.longitude, location.latitude, 0.0 ].join(',')
        #       end
        #     end
        #   end
        # end

        # Lines
        @devices.each do |device|
          xml.Placemark do
            xml.name device.name
            xml.description do
              xml.cdata! device.number.to_s
            end
            xml.LineString do
              xml.tessellate 1
              test = device.device_locations.map do |location|
                [ location.longitude, location.latitude, 0.0 ].join(',')
              end.join("\n")
              xml.coordinates test
            end
          end
        end
      end
    end

    file.close

    render json: { show_kml_on_map: true }
  end

  private

  def check_devices
    render json: { show_kml_on_map: false } and return unless params[:device_ids]

    @devices = Device.includes(:device_locations).find(params[:device_ids])
    @devices.reject!{ |device| device.device_locations.empty? } unless @devices.blank?

    render json: { show_kml_on_map: false } and return if @devices.blank?
  end

end
