class User < ActiveRecord::Base

  PASSWORD_REGEXP = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}$/

  validates_format_of :password,
    with: PASSWORD_REGEXP,
    message: 'should contain lower and uppercase letters, numerical digits and be longer than 5 symbols'

  acts_as_authentic do |config|
    config.validates_length_of_password_field_options(minimum: 6)
  end

end
