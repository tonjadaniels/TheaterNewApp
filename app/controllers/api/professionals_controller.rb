class Api::ProfessionalsController < ApplicationController

  def index
    @professionals = Professionals.all
    render "index.json.jbuilder"
  end

end
