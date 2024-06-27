Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post "/auth/login", to: "auth#login"
      get "/auth/logged_in", to: "auth#logged_in"
      post "/auth/send_otp_email", to: "auth#send_otp_email"
      post "/auth/verify_email", to: "auth#verify_email"
      get "/auth/is_authenticated", to: "auth#is_authenticated"

      # Test Endpoints
      get "/test/redis", to: "test#redis"
      post "/test/redis/read_email_value", to: "test#read_email_value"
      
      # Photo Routes
      post "/upload/photos", to: "posts#upload"
    end
  end
end
