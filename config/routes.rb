Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
        
        post "/auth/login", to: "auth#login"
        get "/auth/logged_in", to: "auth#logged_in"
        post "/auth/send_otp_email", to: "auth#send_otp_email"
        post "/auth/verify_email", to: "auth#verify_email"

      # Test Endpoints
      get "/test/redis", to: "test#redis"
    end
  end
end
