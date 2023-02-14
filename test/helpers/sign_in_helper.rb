require 'helpers/test_password_helper'

module SignInHelper
  def sign_in_as(user)
    visit login_url
    fill_in 'Email', with: user.email
    fill_in 'Password', with: default_password
    click_on 'Login'
  end
end
