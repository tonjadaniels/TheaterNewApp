class Performance < ApplicationRecord

  belongs_to :production, optional: true 

  has_many :carted_tickets

  def formatted_time
    time.strftime("%l:%M %p")
  end

  def unsold_tickets
    tickets_available - tickets_sold
  end
  
end
