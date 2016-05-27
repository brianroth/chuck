class UsersController < ApplicationController
  def create
    if user = User.create(params.permit(:username, :password, :extra))
      id_token = JWT.encode({ id: user.id, username: user.username, extra: user.extra }, Rails.configuration.jwt_key)
      render json: { id_token: id_token }
    else
      render json: user.errors, status: :bad_request
    end
  end
end
