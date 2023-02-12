class Person < ApplicationRecord
  has_many :phones, dependent: :destroy
  has_many :emails, dependent: :destroy
  accepts_nested_attributes_for :emails, allow_destroy: true, reject_if: lambda { |attributes|
                                                                           attributes['address'].blank?
                                                                         }
  accepts_nested_attributes_for :phones, allow_destroy: true, reject_if: lambda { |attributes|
                                                                           attributes['number'].blank?
                                                                         }

  enum salutation: { mr: 'Mr.', ms: 'Ms.', mrs: 'Mrs.' }

  validates :firstname, :lastname, presence: true
end
