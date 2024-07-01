class Api::V1::PostsController < ApplicationController
    def initialize(post_service: PostService.new)
        @post_service = post_service
    end

    def upload
        render json: ResponseEntity.success(data: @post_service.upload(current_user, post_params), message: -> {"posts uploaded"}), status: :created
    end

    def user_posts
        render json: ResponseEntity.success(data: @post_service.user_posts(params), message: -> {"Successfully fetched user posts "}), status: :ok
    end

    def get_post
        render json: ResponseEntity.success(data: @post_service.get_post(params), message: -> {"Successfully fetched user post "}), status: :ok
    end


    private 
    def post_params
        params.require(:post).permit(
            :image,
            :caption
        )
    end
end