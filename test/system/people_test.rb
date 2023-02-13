require 'application_system_test_case'

class PeopleTest < ApplicationSystemTestCase
  setup do
    @person = people(:person_one)
    @phone = phones(:phone_one)
    @email = emails(:email_one)
    @address = addresses(:address_one)
  end

  test 'visiting the index' do
    visit people_url
    assert_selector 'h1', text: 'People'
  end

  test 'creating a Person' do
    visit people_url
    click_on 'Add a Person'

    fill_in 'Firstname', with: @person.firstname
    fill_in 'Middlename', with: @person.middlename
    fill_in 'Lastname', with: @person.lastname
    fill_in 'Birthdate', with: Time.new(1990, 4, 1)
    fill_in 'Comment', match: :first, with: @person.comment
    fill_in 'Ssn', with: @person.ssn
    select 'Mrs.', from: 'Salutation'
    fill_in 'Email address', with: @email.address
    fill_in 'Phone number', with: @phone.number
    fill_in 'Street', with: @address.street
    fill_in 'Town', with: @address.town
    fill_in 'Zip', with: @address.zip
    fill_in 'State', with: @address.state
    select 'USA', from: 'Country'

    click_on 'Submit'

    assert_text 'Person was successfully created'
    click_on 'Back'
  end

  test 'updating a Person' do
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

    assert_text 'Person was successfully updated'
    assert_text new_name
    assert_text new_email
    assert_text new_zip
    assert_text 'Canada'
    click_on 'Back'
  end

  test 'deleting a Person' do
    visit people_url
    page.accept_confirm do
      click_on 'Delete', match: :first
    end

    assert_text 'Person was successfully destroyed'
    assert_no_text @person.firstname
  end
end
