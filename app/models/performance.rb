class Performance < ApplicationRecord

  belongs_to :production, optional: true 

  has_many :carted_tickets
  
end
