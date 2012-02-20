class Device < ActiveRecord::Base

  has_many :device_locations

  validates :number, presence: true
  validates :number, numericality: { only_integer: true }

end
