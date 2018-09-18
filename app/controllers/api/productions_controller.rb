class Api::ProductionsController < ApplicationController

  def index
    @productions = Productions.all
    render "index.json.jbuilder"
  end
  
end
