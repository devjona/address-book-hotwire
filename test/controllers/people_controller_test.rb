require 'test_helper'

class PeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @person = people(:one)
  end

  # should get login page when navigating to index and not logged in
  test 'should get login page when navigating to index and not logged in' do
    get people_url
    assert_redirected_to login_url
  end

  test 'should get index' do
    post_sign_in_as_user(@user)
    get people_url
    assert_response :success
  end

  test 'should get new' do
    post_sign_in_as_user(@user)
    get new_person_url
    assert_response :success
  end

  test 'should create person' do
    post_sign_in_as_user(@user)
    assert_difference('Person.count') do
      post people_url, params: {
        person: {
          firstname: 'Tim',
          lastname: 'Zam',
          ssn: '123-45-6789',
          salutation: 'Mr.',
          birthdate: '1990-01-01',
          phones_attributes: [
            number: '123-456-7890'
          ],
          emails_attributes: [
            address: 'tim@zam.com'
          ],
          addresses_attributes: [
            street: '123 Main St.', town: 'Anytown', state: 'CA', zip: '12345', country: 'USA'
          ]
        }
      }
    end

    assert_redirected_to person_url(Person.last)
  end

  test 'should not create person' do
    post_sign_in_as_user(@user)
    assert_no_difference('Person.count') do
      post people_url, params: {
        person: {
          firstname: '',
          lastname: '',
          ssn: '',
          salutation: '',
          birthdate: '',
          phones_attributes: [
            number: ''
          ],
          emails_attributes: [
            address: ''
          ],
          addresses_attributes: [
            street: '', town: '', state: '', zip: '', country: ''
          ]
        }
      }
    end

    assert_response :unprocessable_entity
  end

  test 'should show person' do
    post_sign_in_as_user(@user)
    get person_url(@person)
    assert_response :success
  end

  test 'should get edit' do
    post_sign_in_as_user(@user)
    get edit_person_url(@person)
    assert_response :success
  end

  test 'should update person' do
    post_sign_in_as_user(@user)
    patch person_url(@person), params: { person: {
      firstname: 'Timothy',
      middlename: 'Titus'
    } }
    assert @person.reload.firstname == 'Timothy'
    assert @person.reload.middlename == 'Titus'
    assert_redirected_to person_url(@person)
  end

  test 'should destroy person' do
    post_sign_in_as_user(@user)
    assert_difference('Person.count', -1) do
      delete person_url(@person)
    end

    assert_redirected_to people_url
  end
end
