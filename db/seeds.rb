# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

seed_people = [
  { firstname: 'Sam', middlename: 'A', lastname: 'Smith', ssn: '123456789', birthdate: '1980-01-01',
    comment: 'This is a comment', salutation: Person.salutations[:mr] },
  { firstname: 'John', middlename: 'B', lastname: 'Doe', ssn: '987654321', birthdate: '1980-01-01',
    comment: 'This is a comment', salutation: Person.salutations[:mr] },
  { firstname: 'Jane', middlename: 'C', lastname: 'Doe', ssn: '111111111', birthdate: '1980-01-01',
    comment: 'This is a comment', salutation: Person.salutations[:ms] },
  { firstname: 'Sally', middlename: 'D', lastname: 'Smith', ssn: '222222222', birthdate: '1980-01-01',
    comment: 'This is a comment', salutation: Person.salutations[:mrs] }
]

phone_numbers = [
  { number: '1234567890', comment: 'This is a comment' },
  { number: '1234567891', comment: 'This is a comment' },
  { number: '1234567892', comment: 'This is a comment' },
  { number: '1234567893', comment: 'This is a comment' }
]

emails = [
  { address: 'some@email.com', comment: 'This is a comment' },
  { address: 'another@email.com', comment: 'This is a comment' },
  { address: 'hey@dude.com', comment: 'This is a comment' },
  { address: 'yo@squid.co', comment: 'This is a comment' }
]

addresses = [
  { street: '123 Main St', town: 'Townsville', zip: '12345', state: 'CA', country: 'USA' },
  { street: '456 Main St', town: 'Townsville', zip: '12345', state: 'CA', country: 'USA' },
  { street: '789 Main St', town: 'Townsville', zip: '12345', state: 'CA', country: 'USA' },
  { street: '101 Main St', town: 'Townsville', zip: '12345', state: 'CA', country: 'USA' }
]

seed_people.each_with_index do |person, index|
  Person.create(person)
  Email.create(emails[index].merge(person_id: Person.last.id))
  Phone.create(phone_numbers[index].merge(person_id: Person.last.id))
  Address.create(addresses[index].merge(person_id: Person.last.id))
end
