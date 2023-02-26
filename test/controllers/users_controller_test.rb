require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  setup do
    @user = User.new
    @name = 'Bill'
    @email = 'bill@bill.com'
    @password = 'password'
    @user_one = users(:one)
  end

  test 'should not create user when empty form submitted' do
    post signup_url, params: { user: { name: '', email: '', password: '' } }
    assert_response :unprocessable_entity
  end

  test 'should create user if email is unique, name is filled, password requirements are met' do
    post signup_url, params: { user: { name: @name, email: @email, password: @password } }
    assert_response :found
    assert_redirected_to root_url
  end

  test 'should not create user if email is not unique' do
    post signup_url, params: { user: { name: @user_one.name, email: @user_one.email, password: 'wrongonebro' } }
    assert_response :unprocessable_entity
  end
end
