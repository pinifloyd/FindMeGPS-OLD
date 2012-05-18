class Device < ActiveRecord::Base

  has_many :device_locations, dependent: :destroy

  validates :number, presence: true
  validates :number, numericality: { only_integer: true }

end
