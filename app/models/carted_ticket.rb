class CartedTicket < ApplicationRecord

  belongs_to :member
  belongs_to :performance
  belongs_to :order, optional: true 


end
