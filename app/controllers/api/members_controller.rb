class Api::MembersController < ApplicationController

  def create
    member = Member.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      phone: params[:phone],
      address: params[:address]

    )
    if member.save
      render json: {message: 'Member created successfully'}, status: :created
    else
      render json: {errors: member.errors.full_messages}, status: :bad_request
    end
  end
end
