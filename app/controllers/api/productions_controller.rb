class Api::ProductionsController < ApplicationController

  def index
    @productions = Productions.all
    render "index.json.jbuilder"
  end

  def show
    @production = Production.find(params[:id])
    render "show.json.jbuilder"
  end


end
