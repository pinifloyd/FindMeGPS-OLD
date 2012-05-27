class Device < ActiveRecord::Base

  has_many   :device_locations, dependent: :destroy
  belongs_to :user

  validates :number, presence: true
  validates :number, numericality: { only_integer: true }

end
