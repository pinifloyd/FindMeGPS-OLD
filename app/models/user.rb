class User < ActiveRecord::Base

  PASSWORD_REGEXP = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}$/

  has_and_belongs_to_many :roles

  validates_format_of :password, :password_confirmation,
    with:    PASSWORD_REGEXP,
    if:      :validate_password?,
    message: I18n.t('users.password_error')

  validates :roles, presence: true

  acts_as_authentic do |config|
    config.merge_validates_length_of_password_field_options(minimum: 6)
  end

  def role_symbols
    roles.map do |role|
      role.name.underscore.to_sym
    end
  end

  private

  def validate_password?
    new_record? || password_changed?
  end

end
