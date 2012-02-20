class DeviceLocation < ActiveRecord::Base

  validates :lat, :lng, presence: true
  validates :lat, :lng, numericality: true

end
