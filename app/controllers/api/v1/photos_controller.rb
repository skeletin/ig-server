class Api::V1::PhotosController < ApplicationController
    def initialize(photo_service: PhotoService.new)
        @photo_service = photo_service
    end

    def upload
        render json: ResponseEntity.success(data: @photo_service.upload(current_user, photo_params), message: -> {"Photo uploaded"}), status: :created
    end


    private 
    def photo_params
        params.require(:photo).permit(
            :image,
            :caption
        )
    end
end