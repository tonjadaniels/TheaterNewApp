class Api::RolesController < ApplicationController

  def index
    @roles = Roles.all
    render "index.json.jbuilder"
  end

  def show
    @role = Roles.find(params[:id])
    render 'show.json.jbuilder'   
  end


end
