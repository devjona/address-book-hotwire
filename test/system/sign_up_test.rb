require 'application_system_test_case'

class LoginTest < ApplicationSystemTestCase
  setup do
    @person = people(:one)
    @user = users(:one)
  end

  test 'create a new user, login with new credentials, logout' do
    visit login_url
    click_on 'Sign Up!'
    fill_in 'Name', with: 'Some Name'
    fill_in 'Email', with: 'some@email.com'
    fill_in 'Password', with: 'password'

    click_on 'Sign Up'

    # It would be helpful to have an 'empty state' for someone who signs up and has no people
    assert_text 'People'
    assert_text 'Add a Person'
    assert_no_text 'Show'

    click_on 'Log out'
    assert_selector 'h1', text: 'Login'
    assert_text "Don't have an account?"
  end
end
