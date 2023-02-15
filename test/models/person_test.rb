require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test 'should not save a person without any info' do
    person = Person.new
    assert_not person.save
  end

  test 'should not save a person without required info' do
    person = Person.new
    person.firstname = 'John'
    assert_not person.save
  end

  test 'should save a person with required info' do
    person = Person.new
    person.firstname = 'John'
    person.lastname = 'Doe'
    assert person.save
  end

  test 'should not save a person when dependent records are not properly saved' do
    person = Person.new(firstname: 'John', lastname: 'Doe')
    person.emails.build(address: '', comment: 'test')
    person.addresses.build(street: '', town: 'Anytown', zip: '12345')
    person.phones.build(number: '', comment: 'test')

    assert_not person.save
  end

  test 'should save a person when dependent records are properly saved' do
    person = Person.new(firstname: 'John', lastname: 'Doe')
    person.emails.build(address: 'john@doe.com', comment: 'test')
    person.addresses.build(street: '123 Main St', town: 'Anytown', zip: '12345')
    person.phones.build(number: '1234567890', comment: 'test')

    assert person.save
  end
end
