require_relative '../services/jwt_service'
class ApplicationController < ActionController::API
  include GlobalErrorHandler
  include JWTService

  before_action :authorized?

  
  private

  def authorized?
    decode_token(request)
  end
end