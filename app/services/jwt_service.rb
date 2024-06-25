module JWTService
  def encode_token(payload)
    JWT.encode(payload, 'secret', 'HS256')
  end

  def decode_token(request)
    header = request.headers['Authorization']
    raise UnauthorizedError.new("No Authorization header provided.") unless header
    token = header.split(" ")[1]
    begin
      get_current_user(JWT.decode(token, 'secret', true, algorithm: 'HS256'))
    rescue JWT::DecodeError
      raise UnauthenticatedError
    end
  end

  def current_user
    @current_user
  end

  private  
  def get_current_user(decoded_token)
    user_id = decoded_token[0]['user_id']
    @current_user = User.find_by(id: user_id)
    @current_user ? @current_user : raise(UnauthenticatedError)
  end
end
