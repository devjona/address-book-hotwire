require 'application_system_test_case'

class LoginTest < ApplicationSystemTestCase
  setup do
    @person = people(:person_one)
    @user = users(:one)
  end

  test 'visit login page' do
    visit login_url
    assert_selector 'h1', text: 'Login'
    assert_text "Don't have an account?"
  end

  test 'login with valid credentials, logout' do
    sign_in_as(@user)
    assert_text 'People'
    assert_text @person.firstname
    assert_text 'Show'
    assert_text 'Edit'
    assert_text 'Delete'

    click_on 'Log out'
    assert_selector 'h1', text: 'Login'
    assert_text "Don't have an account?"
  end
end
