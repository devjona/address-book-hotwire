require 'application_system_test_case'

class PeopleTest < ApplicationSystemTestCase
  setup do
    @person = people(:person_one)
    @phone = phones(:phone_one)
    @email = emails(:email_one)
    @address = addresses(:address_one)
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
  end

  # test 'creating a Person with insufficient info' do
  #   sign_in_as(@user)
  #   visit people_url
  #   click_on 'Add a Person'
  #   fill_in_second_person_insufficient_dependent_records
  #   click_on 'Submit'
  #   byebug
  #   assert_text 'Please fill out this field'
  #   # You need a flash notice on the page of some sort
  # end

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

    assert_text new_name
    assert_text new_email
    assert_text new_zip
    assert_text 'Canada'
    click_on 'Back'
  end

  test 'deleting a Person' do
    sign_in_as(@user)
    visit people_url
    page.accept_confirm do
      click_on 'Delete', match: :first
    end

    assert_no_text @person.firstname
  end

  def fill_in_second_person_insufficient_dependent_records
    fill_in 'Firstname', with: 'Tim'
    fill_in 'Lastname', with: 'Zam'
    fill_in 'Birthdate', with: Time.new(1990, 4, 1)
    fill_in 'Comment', match: :first, with: 'This is a comment.'
    fill_in 'Ssn', with: '123456789'
    select 'Mr.', from: 'Salutation'
    fill_in 'Email address', with: ''
    fill_in 'Phone number', with: ''
    fill_in 'Street', with: ''
    fill_in 'Town', with: ''
    fill_in 'Zip', with: ''
    fill_in 'State', with: ''
    select 'USA', from: 'Country'
  end

  def fill_in_second_person
    fill_in 'Firstname', with: 'Tim'
    fill_in 'Lastname', with: 'Zam'
    fill_in 'Birthdate', with: Time.new(1990, 4, 1)
    fill_in 'Comment', match: :first, with: 'This is a comment.'
    fill_in 'Ssn', with: '123456789'
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
