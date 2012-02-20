class Device < ActiveRecord::Base

  validates :number, presence: true
  validates :number, numericality: { only_integer: true }

end
