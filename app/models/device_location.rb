class DeviceLocation < ActiveRecord::Base

  belongs_to :device

  validates :latitude, :longitude, presence: true
  validates :latitude, :longitude, numericality: true

end
