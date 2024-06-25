class Api::V1::AuthController < ApplicationController
  skip_before_action :authorized?

  def initialize(auth_service: AuthService.new)
    @auth_service = auth_service
  end

  def logged_in
    render json: ResponseEntity.success(data: @auth_service.logged_in(request), message: -> {"User is logged in"}), status: :ok
  end
  
  def login
    render json: ResponseEntity.success(data: @auth_service.login(user_params), message: -> {"User logged in"}), status: :ok
  end

  def send_otp_email
    email = user_params[:email]
    @auth_service.cache_email(email)
    OtpMailer.send_otp_email(email).deliver_later
    render json: ResponseEntity.success(data: email, message: -> { "Email received" }), status: :ok
  end

  def verify_email
    render json: ResponseEntity.success(data: @auth_service.verify_email(user_params), message: -> {"Email verified"}), status: :ok 
  end

  def is_authenticated
    render json: ResponseEntity.success(data: @auth_service.is_authenticated(request), message: -> { "User is logged in"}), status: :ok
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :username,
      :full_name,
      :birth_date,
      :password,
      :password_confirmation,
      :passcode
    )
  end
end

