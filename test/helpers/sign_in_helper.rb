require 'helpers/test_password_helper'

module SignInHelper
  def sign_in_as(user)
    visit login_url
    fill_in 'Email', with: user.email
    fill_in 'Password', with: default_password
    click_on 'Login'
  end

  # a hlper method to sign in as a user in a controller test
  def post_sign_in_as_user(user)
    post login_url, params: { email: user.email, password: default_password }
  end
end
