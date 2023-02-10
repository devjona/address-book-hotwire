# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

seed_people = [
  { firstname: 'Sam', middlename: 'A', lastname: 'Smith', ssn: '123-45-6789', birthdate: '1980-01-01',
    comment: 'This is a comment' },
  { firstname: 'John', middlename: 'B', lastname: 'Doe', ssn: '987-65-4321', birthdate: '1980-01-01',
    comment: 'This is a comment' },
  { firstname: 'Jane', middlename: 'C', lastname: 'Doe', ssn: '111-11-1111', birthdate: '1980-01-01',
    comment: 'This is a comment' },
  { firstname: 'Sally', middlename: 'D', lastname: 'Smith', ssn: '222-22-2222', birthdate: '1980-01-01',
    comment: 'This is a comment' }
]

seed_people.each do |person|
  Person.create(person)
end
