class Order < ApplicationRecord

  belongs_to :member
  has_many :carted_tickets
  has_many :performances, through: :carted_tickets
end
