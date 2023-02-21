require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'user cannot be saved if: name, email, password_digest are null' do
    user = User.new
    assert_not user.save
  end

  test 'user cannot be saved if: name is null' do
    user = User.new
    user.name = ''
    assert_not user.save
  end

  test 'user cannot be saved if: email is null' do
    user = User.new
    user.email = ''
    assert_not user.save
  end

  test 'user cannot be saved if: password_digest is null' do
    user = User.new
    user.password = ''
    assert_not user.save
  end

  test 'user can be saved if: name, email, password_digest are not null' do
    user = create_valid_user
    assert user.save
  end

  test 'user cannot be saved if: email is not unique' do
    user = create_valid_user
    user.save
    user2 = create_valid_user
    assert_not user2.save
  end

  test 'user password must be at least 8 characters' do
    user = User.new(name: 'test', email: 'some@email.com', password: '1234567')
    assert_not user.save
  end

  private

  def create_valid_user
    User.new(name: 'test', email: 'user@test.com', password: 'password')
  end
end
