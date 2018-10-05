class Member < ApplicationRecord
has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

has_many :carted_tickets
has_many :orders
  
end
