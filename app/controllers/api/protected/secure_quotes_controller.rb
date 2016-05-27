class Api::Protected::QuotesController < Api::QuotesController
  before_action :require_login

private 
  def require_login
    if request.headers['Authorization']
      auth_token = request.headers['Authorization'].split
      begin
        args = JWT.decode(auth_token[1], Rails.configuration.jwt_key).first
        return true
      rescue JWT::DecodeError => e
      end
    end

    head :unauthorized
  end
end
