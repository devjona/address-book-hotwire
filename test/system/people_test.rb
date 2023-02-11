require 'application_system_test_case'

class PeopleTest < ApplicationSystemTestCase
  setup do
    @person = people(:one)
  end

  test 'visiting the index' do
    visit people_url
    assert_selector 'h1', text: 'People'
  end

  test 'creating a Person' do
    visit people_url
    click_on 'New Person'

    fill_in 'Firstname', with: @person.firstname
    fill_in 'Middlename', with: @person.middlename
    fill_in 'Lastname', with: @person.lastname
    fill_in 'Birthdate', with: Time.new(1990, 4, 1)
    fill_in 'Comment', with: @person.comment
    fill_in 'Ssn', with: @person.ssn
    select 'Mrs.', from: 'Salutation'

    click_on 'Create Person'

    assert_text 'Person was successfully created'
    click_on 'Back'
  end

  test 'updating a Person' do
    visit people_url
    click_on 'Edit', match: :first

    click_on 'Update Person'

    # Actually change the person, like last name

    assert_text 'Person was successfully updated'
    click_on 'Back'
    # Assert their name is changed
  end

  test 'destroying a Person' do
    visit people_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Person was successfully destroyed'
    # Back on the index page, assert the person is not there
  end
end
