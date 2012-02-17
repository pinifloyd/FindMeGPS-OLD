class Role < ActiveRecord::Base

  has_and_belongs_to_many :users

  validates :name, uniqueness: true

  DEFAULT_ROLE = 'User'

  def self.default_role
    Role.where(name: DEFAULT_ROLE)
  end
end
