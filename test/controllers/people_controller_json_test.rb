require 'test_helper'

class PeopleControllerTestJSON < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @person = people(:one)
  end

  # should get login page when navigating to index and not logged in
  test 'JSON: should get login page when navigating to index and not logged in' do
    get people_url
    assert_redirected_to login_url
  end

  test 'JSON: should get index' do
    post_sign_in_as_user_json(@user)
    get people_url, as: :json

    assert_response :success
    assert JSON.parse(response.body).first['id'] == Person.first.id
    assert JSON.parse(response.body).first['user_id'] == @user.id
  end

  test 'JSON: should create person' do
    post_sign_in_as_user_json(@user)
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
      }, as: :json
    end

    assert_response :success
    assert JSON.parse(response.body)['id'] == Person.last.id
  end

  test 'JSON: should not create person' do
    post_sign_in_as_user_json(@user)
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
      }, as: :json
    end
    assert_response :unprocessable_entity
  end

  test 'JSON: should show person' do
    post_sign_in_as_user_json(@user)
    get person_url(@person), as: :json
    assert_response :success
    assert JSON.parse(response.body)['id'] == @person.id
  end

  test 'JSON: should update person' do
    post_sign_in_as_user_json(@user)
    patch person_url(@person), params: { person: {
      firstname: 'Timothy',
      middlename: 'Titus'
    } }, as: :json
    assert @person.reload.firstname == 'Timothy'
    assert @person.reload.middlename == 'Titus'
    assert_response :success
  end

  test 'JSON: should destroy person' do
    post_sign_in_as_user_json(@user)
    assert_difference('Person.count', -1) do
      delete person_url(@person), as: :json
    end

    assert_response :success
  end
end
