class Api::PerformancesController < ApplicationController

  def index
    @performances = Performance.all
    render "index.json.jbuilder"
  end

end
