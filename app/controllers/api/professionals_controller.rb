class Api::ProfessionalsController < ApplicationController

  def index
    @professionals = Professional.all
    render "index.json.jbuilder"
  end

  def show
    @professional = Professional.find(params[:id])
    render "show.json.jbuilder"
  end

    def create
    @professional = Professional.create(
      name: params[:name],
      bio: params[:bio],
      image: params[:image]
      )

      if @performance.save
        render "show.json.jbuilder"
      else
        render json: {errors: @performance.errors.full_message}, status: :unprocessable_entity
      end

  end

  def update
    @professional = Professional.find(params[:id])
      @professional.name = params[:name] || @professional.name
      @professional.bio = params[:bio] || @professional.bio
      @professional.image = params[:image] || @professional.image

      if @professional.save
        render "show.json.jbuilder"
      else
        render json: {errors: @professional.errors.full_message}, status: :unprocessable_entity
      end

  end

end
