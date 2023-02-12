class Email < ApplicationRecord
  belongs_to :person
  validates :address, presence: true
end
