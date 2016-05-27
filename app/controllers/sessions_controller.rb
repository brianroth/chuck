class SessionsController < ApplicationController
  def create
    if user = User.find_by_username_and_password(params[:username], params[:password])
      id_token = JWT.encode({ id: user.id, username: user.username, extra: user.extra }, Rails.configuration.jwt_key)
      render json: { id_token: id_token }
    else
      head :not_found
    end
  end
end
