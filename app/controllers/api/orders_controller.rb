class Api::OrdersController < ApplicationController

  def create
    @order = Order.create(
      member_id: current_member.id,
      total: params[:total]
      )
    if @order.save 
      @carted_ticket = CartedTicket.find(params[:ticket_id])
      @carted_ticket.status = "ordered"
      @carted_ticket.order_id = @order.id
      @carted_ticket.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @performance.errors.full_message}, status: :unprocessable_entity
    end

  end

  def show
    @order = Order.find(params[:id])
    render "show.json.jbuilder"
  end

end
