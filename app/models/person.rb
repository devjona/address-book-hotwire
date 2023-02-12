class Person < ApplicationRecord
  has_many :phones
  accepts_nested_attributes_for :phones, allow_destroy: true, reject_if: lambda { |attributes|
                                                                           attributes['number'].blank?
                                                                         }

  enum salutation: { mr: 'Mr.', ms: 'Ms.', mrs: 'Mrs.' }

  validates :firstname, :lastname, presence: true
end
