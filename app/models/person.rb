class Person < ApplicationRecord
  enum salutation: { mr: 'Mr.', ms: 'Ms.', mrs: 'Mrs.' }
  validates :firstname, :lastname, presence: true

  # has_many... will be added later
end
