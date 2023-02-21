class User < ApplicationRecord
  has_secure_password

  has_many :people, dependent: :destroy
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password, presence: true, length: { minimum: 8 }, allow_nil: false
end
