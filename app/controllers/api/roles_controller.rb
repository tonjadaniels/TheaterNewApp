class Api::RolesController < ApplicationController

  def index
    @roles = Roles.all
    render "index.json.jbuilder"
  end

end
