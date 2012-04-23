require 'spec_helper'

describe User do

  before do
    @email    = 'example@gmail.com'
    @password = '1qa@WS3ed'
    @roles    = [ Role.new(name: 'User', active: true) ]
  end

  it 'should be valid' do
    user = User.new \
      email:                 @email,
      password:              @password,
      password_confirmation: @password,
      roles:                 @roles

    user.should be_valid
  end

  it 'should not allow a blank password and confirmation password' do
    user = User.new \
      email:                 @email,
      password:              '',
      password_confirmation: '',
      roles:                 @roles

    user.should_not be_valid
  end

  it 'should not allow a blank email' do
    user = User.new \
      email:                 '',
      password:              @password,
      password_confirmation: @password,
      roles:                 @roles

    user.should_not be_valid
  end

  it 'should not allow with different password and password_confirmation' do
    user = User.new \
      email:                 @email,
      password:              @password,
      password_confirmation: @password + 'not_valid',
      roles:                 @roles

    user.should_not be_valid
  end

  it 'should not allow without password' do
    user = User.new \
      email:                 @email,
      password:              '',
      password_confirmation: @password,
      roles:                 @roles

    user.should_not be_valid
  end

  it 'should not accept passwords less than 6 chars' do
    password = 'trolo'

    user = User.new \
      email:                 @email,
      password:              password,
      password_confirmation: password,
      roles:                 @roles

    user.should_not be_valid
  end

  it 'should not accept passwords without uppercase letters' do
    password = 'aa22oo33'

    user = User.new \
      email:                 @email,
      password:              password,
      password_confirmation: password,
      roles:                 @roles

    user.should_not be_valid
  end

  it 'should not accept passwords wich contains only digits' do
    password = 1234567

    user = User.new \
      email:                 @email,
      password:              password,
      password_confirmation: password,
      roles:                 @roles

    user.should_not be_valid
  end

  it 'should not accept passwords with special chars' do
    password = '!$trololo#$'

    user = User.new \
      email:                 @email,
      password:              password,
      password_confirmation: password,
      roles:                 @roles

    user.should_not be_valid
  end

  it 'should not allow without role' do
    user = User.new \
      email: @email,
      password: @password,
      password_confirmation: @password

    user.should_not be_valid
  end
end
