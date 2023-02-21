class User < ApplicationRecord
  has_secure_password

  has_many :people, dependent: :destroy
  validates :email, presence: true, uniqueness: true, allow_nil: false
  validates :name, presence: true, allow_nil: false
  validates :password, presence: true, length: { minimum: 8 }, allow_nil: false
end
