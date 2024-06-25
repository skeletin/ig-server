class AuthService < ApplicationService
  public 

  def logged_in(request)
    decode_token(request)
  end

  def login(user_params)
    
    @user = User.find_by(email: user_params[:email])
    raise InvalidCredentialsError unless @user && @user.authenticate(user_params[:password])
    encode_token(user_id: @user.id)
  end

  def cache_email(email)
    genrate_otp(email)
  end

  def verify_email(user_params)
    # cached_passcode = Rails.cache.read(user_params[:email])
    cached_passcode = CacheService.read(user_params[:email])
    raise InvalidOtpError unless cached_passcode == user_params[:passcode]
    register(user_params)
  end

  def is_authenticated(request)
    decode_token(request)
  end
  
  private
  
  def genrate_otp(email)
    otp = rand(100_000..999_999).to_s
    CacheService.write(email, otp)
    # Rails.cache.write(email, otp)
    email
  end

  def register(user_params)
    user_params.extract!(:passcode)
    @user = User.create!(user_params)
    encode_token(user_id: @user.id)
  end
end