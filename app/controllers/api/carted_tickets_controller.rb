class Api::CartedTicketsController < ApplicationController

  before_action :authenticate_member

def index

   # @carted_tickets = CartedTicket.all
   #  render "index.json.jbuilder"

    # if current_member 
      @carted_tickets = current_member.carted_tickets.where('status = ?', 'carted')

      render 'index.json.jbuilder'
      
    # else
    #   render json: ["fail"]
    # end
end

def show
  @carted_ticket = CartedTicket.find(params[:id])

  render "show.json.jbuilder"

end 

 def create
   @carted_ticket = CartedTicket.create(
     performance_id: params[:performance_id],
     member_id: current_user.id,
     quantity: params[:quantity],
     status: "carted",
   )

   render "show.json.jbuilder"
 end

def update
  @carted_ticket = CartedTicket.find(params[:id])
  @carted_ticket.quantity = params[:quantity] 
  @carted_ticket.save

  render "show.json.jbuilder"

end 


def destroy
   @carted_ticket = CartedTicket.find_by(id: params[:id])
   @carted_ticket.update(status: "removed")
   render json: {message: "Carted Ticket removed"}
end


end
