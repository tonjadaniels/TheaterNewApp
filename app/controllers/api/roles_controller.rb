class Api::RolesController < ApplicationController

  def index
    @roles = Role.all
    render "index.json.jbuilder"
  end

  def show
    @role = Role.find(params[:id])
    render 'show.json.jbuilder'   
  end


end
