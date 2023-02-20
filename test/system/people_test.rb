require 'application_system_test_case'

class PeopleTest < ApplicationSystemTestCase
  setup do
    @person = people(:one)
    @phone = phones(:one)
    @email = emails(:email_one)
    @address = addresses(:one)
    @user = users(:one)
  end

  test 'visiting the people index, redirected to login' do
    visit people_url
    assert_selector 'h1', text: 'Login'
  end

  test 'creating a Person' do
    sign_in_as(@user)
    visit people_url
    click_on 'Add a Person'
    fill_in_second_person
    click_on 'Submit'
    assert_text 'Tim Zam'
    assert_text 'Person was successfully created.'
  end

  # test submitting a person with no data
  test 'creating a Person with no data' do
    sign_in_as(@user)
    visit people_url
    click_on 'Add a Person'
    click_on 'Submit'
    assert_text 'prohibited this person from being saved:'
  end

  test 'updating a Person' do
    sign_in_as(@user)
    new_name = 'Sigroy'
    new_email = 'sig@roy.com'
    new_zip = '98765'
    visit people_url
    assert_text @person.firstname

    click_on 'Edit', match: :first
    fill_in 'Firstname', with: new_name
    fill_in 'Email address', with: new_email
    fill_in 'Zip', with: new_zip
    select 'Canada', from: 'Country'
    click_on 'Submit'

    assert_text 'Person was successfully updated.'
    assert_text new_name
  end

  test 'deleting a Person' do
    sign_in_as(@user)
    visit people_url
    page.accept_confirm do
      click_on 'Delete', match: :first
    end

    assert_text 'Person was successfully deleted.'
    assert_no_text @person.firstname
  end

  def fill_in_second_person
    fill_in 'Firstname', with: 'Tim'
    fill_in 'Lastname', with: 'Zam'
    fill_in 'Birthdate', with: Time.new(1990, 4, 1)
    fill_in 'Comment', match: :first, with: 'This is a comment.'
    fill_in 'SSN', with: '123456789'
    select 'Mr.', from: 'Salutation'
    fill_in 'Email address', with: 'tim@zam.com'
    fill_in 'Phone number', with: '1234567890'
    fill_in 'Street', with: '123 Main St.'
    fill_in 'Town', with: 'Townsville'
    fill_in 'Zip', with: '12345'
    fill_in 'State', with: 'CA'
    select 'USA', from: 'Country'
  end
end
