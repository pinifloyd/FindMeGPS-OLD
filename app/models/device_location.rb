class DeviceLocation < ActiveRecord::Base

  belongs_to :device

  validates :lat, :lng, presence: true
  validates :lat, :lng, numericality: true

end
