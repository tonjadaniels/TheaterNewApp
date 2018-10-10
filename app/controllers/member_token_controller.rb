class MemberTokenController < Knock::AuthTokenController

  protect_from_forgery with: :null_session
  
  def create
    email = request.params["auth"] && request.params["auth"]["email"]    
    password = request.params["auth"] && request.params["auth"]["password"]
    member = Member.find_by(email: email)
    if member && member.authenticate(password)
      body = {
        jwt: auth_token.token,
        member: { id: member.id, name: member.name, email: member.email, admin: member.admin }
      }
      render json: body, status: :created
    else
      render json: {}
    end
  end
end
