class Person < ApplicationRecord
  belongs_to :user
  has_many :phones, dependent: :destroy
  has_many :emails, dependent: :destroy
  has_many :addresses, dependent: :destroy

  accepts_nested_attributes_for :emails, allow_destroy: true, reject_if: lambda { |attributes|
                                                                           attributes['address'].blank?
                                                                         }
  accepts_nested_attributes_for :phones, allow_destroy: true, reject_if: lambda { |attributes|
                                                                           attributes['number'].blank?
                                                                         }

  accepts_nested_attributes_for :addresses, allow_destroy: true, reject_if: lambda { |attributes|
                                                                              attributes['street'].blank? && attributes['town'].blank? && attributes['zip'].blank?
                                                                            }

  enum salutation: { mr: 'Mr.', ms: 'Ms.', mrs: 'Mrs.' }

  validates :firstname, :lastname, presence: true
  validates_associated :phones, :emails, :addresses

  def build_nested_attributes
    phones.build if phones.empty?
    emails.build if emails.empty?
    addresses.build if addresses.empty?
  end
end
