class Api::V1::TestController < ApplicationController
    skip_before_action :authorized?

    def initialize(auth_service: AuthService.new)
        @auth_service = auth_service
    end

    def redis
        Rails.cache.write("test", "key")
        render json: Rails.cache.read("test")
    end
end