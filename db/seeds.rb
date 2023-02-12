# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

seed_people = [
  { firstname: 'Sam', middlename: 'A', lastname: 'Smith', ssn: '123-45-6789', birthdate: '1980-01-01',
    comment: 'This is a comment', salutation: Person.salutations[:mr] },
  { firstname: 'John', middlename: 'B', lastname: 'Doe', ssn: '987-65-4321', birthdate: '1980-01-01',
    comment: 'This is a comment', salutation: Person.salutations[:mr] },
  { firstname: 'Jane', middlename: 'C', lastname: 'Doe', ssn: '111-11-1111', birthdate: '1980-01-01',
    comment: 'This is a comment', salutation: Person.salutations[:ms] },
  { firstname: 'Sally', middlename: 'D', lastname: 'Smith', ssn: '222-22-2222', birthdate: '1980-01-01',
    comment: 'This is a comment', salutation: Person.salutations[:mrs] }
]

phone_numbers = [
  { number: '123-456-7890', comment: 'This is a comment' },
  { number: '123-456-7891', comment: 'This is a comment' },
  { number: '123-456-7892', comment: 'This is a comment' },
  { number: '123-456-7893', comment: 'This is a comment' }
]

emails = [
  { address: 'some@email.com', comment: 'This is a comment' },
  { address: 'another@email.com', comment: 'This is a comment' },
  { address: 'hey@dude.com', comment: 'This is a comment' },
  { address: 'yo@squid.co', comment: 'This is a comment' }
]

seed_people.each_with_index do |person, index|
  Person.create(person)
  Email.create(emails[index].merge(person_id: Person.last.id))
  Phone.create(phone_numbers[index].merge(person_id: Person.last.id))
end
