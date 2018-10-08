class Performance < ApplicationRecord

  belongs_to :production, optional: true 

  has_many :carted_tickets

  def formatted_time
    time.strftime("%l:%M %p")
  end
  
end
