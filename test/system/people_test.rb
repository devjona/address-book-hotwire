require 'application_system_test_case'

class PeopleTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
    @user_two = users(:two)

    @person = people(:one)
    @phone = phones(:one)
    @email = emails(:email_one)
    @address = addresses(:one)
  end

  test "visiting the people index, not seeing another user's people" do
    sign_in_as(@user_two)
    visit people_url
    assert_selector 'h2', text: 'People'
    assert_no_text @person.firstname
  end

  test 'Signing in, seeing people that belong to the User, and the Person details' do
    sign_in_as(@user)
    visit people_url
    assert_selector 'h2', text: 'People'
    assert_text @person.firstname
    click_on 'Show', match: :first

    assert_text @person.firstname
    assert_text @person.lastname
    assert_text @person.ssn
    assert_text @person.birthdate
    assert_text @person.comment

    assert_text @email.address
    assert_text @email.comment

    assert_text @phone.number
    assert_text @phone.comment

    assert_text @address.street
    assert_text @address.town
    assert_text @address.zip
    assert_text @address.state
    assert_text @address.country.upcase
  end

  test 'creating a Person with no data, seeing errors, then providing correct inputs' do
    sign_in_as(@user)
    visit people_url
    click_on 'Add a Person'
    click_on 'Submit'
    assert_text 'prohibited this person from being saved:'
    fill_in_second_person
    click_on 'Submit'
    assert_text 'Tim Zam'
    assert_text 'Person was successfully created.'
  end

  test 'updating a Person' do
    sign_in_as(@user)
    new_name = 'Sigroy'
    new_email = 'sig@roy.com'
    visit people_url
    assert_text @person.firstname

    edit_links = all('a', text: 'Edit')
    edit_links.last.click
    fill_in 'Firstname', with: new_name
    fill_in 'Email address', with: new_email
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
