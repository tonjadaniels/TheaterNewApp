class Api::PerformancesController < ApplicationController

   before_action :authenticate_admin, except: [:index, :show]

  def index
    @performances = Performance.all
    render "index.json.jbuilder"
  end

  def show
    @performance = Performance.find(params[:id])
    render "show.json.jbuilder"
  end

  def create
    @performance = Performance.create(
      production_id: params[:production_id],
      date: params[:date],
      time: params[:time],
      tickets_available: params[:tickets_available],
      tickets_sold: params[:tickets_sold],
      ticket_price: params[:ticket_price]
      )

      if @performance.save
        render "show.json.jbuilder"
      else
        render json: {errors: @performance.errors.full_message}, status: :unprocessable_entity
      end

  end

  def update
    @performance = Performance.find(params[:id])
      @performance.production_id = params[:production_id] || @performance.production_id
      @performance.date = params[:date] || @performance.date
      @performance.time = params[:time] || @performance.time
      @performance.tickets_available = params[:tickets_available] || @performance.tickets_available
      @performance.tickets_sold = params[:tickets_sold] || @performance.tickets_sold
      @performance.ticket_price = params[:ticket_price] || @performance.ticket_price

      if @performance.save
        render "show.json.jbuilder"
      else
        render json: {errors: @performance.errors.full_message}, status: :unprocessable_entity
      end

  end        


end
