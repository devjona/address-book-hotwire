class User < ApplicationRecord
  has_secure_password

  has_many :people, dependent: :destroy
end
