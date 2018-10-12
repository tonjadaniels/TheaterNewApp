class ApplicationController < ActionController::Base

  protect_from_forgery with: :null_session
  include Knock::Authenticable

  def authenticate_admin
    unless current_member && current_member.admin
      render json: {}, status: :unauthorized
    end
  end


end
