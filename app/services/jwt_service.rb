module JWTService
  def encode_token(payload)
    JWT.encode(payload, 'secret', 'HS256')
  end

  def decode_token(request)
    header = request.headers['Authorization']
    if header
      token = header.split(" ")[1]
      begin
        get_current_user(JWT.decode(token, 'secret', true, algorithm: 'HS256'))
      rescue JWT::DecodeError
        raise UnauthenticatedError
      end
    end
  end

  def authorized?
    unless !!current_user
      render json: { message: 'Please log in' }, status: :unauthorized
    end
  end

  private  
  def get_current_user(decoded_token)
    user_id = decoded_token[0]['user_id']
    @user = User.find_by(id: user_id)
    @user ? Api::V1::UserSerializer.new(@user) : raise(UnauthenticatedError)
  end
end
