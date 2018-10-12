class Api::RolesController < ApplicationController

  before_action :authenticate_admin, except: [:index, :show]

  def index
    @roles = Role.all
    render "index.json.jbuilder"
  end

  def show
    @role = Role.find(params[:id])
    render 'show.json.jbuilder'   
  end

  def create
    @role = Role.create(
      production_id: params[:production_id],
      professional_id: params[:professional_id],
      title: params[:title]
      )

      if @role.save
        render "show.json.jbuilder"
      else
        render json: {errors: @role.errors.full_message}, status: :unprocessable_entity
      end

  end

  def update
    @role = Role.find(params[:id])
      @role.production_id = params[:production_id] || @role.production_id
      @role.professional_id = params[:professional_id] || @role.professional_id
      @role.title = params[:title] || @role.title

      if @role.save
        render "show.json.jbuilder"
      else
        render json: {errors: @role.errors.full_message}, status: :unprocessable_entity
      end

  end


end
