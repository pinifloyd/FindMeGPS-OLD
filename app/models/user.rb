class User < ActiveRecord::Base

  PASSWORD_REGEXP = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}$/

  has_and_belongs_to_many :roles

  validates_format_of :password,
    with: PASSWORD_REGEXP,
    message: 'should contain lower and uppercase letters, numerical digits and be longer than 5 symbols'

  validates :roles, presence: true

  acts_as_authentic do |config|
    config.validates_length_of_password_field_options(minimum: 6)
  end

  def role_symbols
    roles.map do |role|
      role.name.underscore.to_sym
    end
  end
end
