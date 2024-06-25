class PhotoService
    def upload(current_user, photo_params)
        photo = current_user.photos.build(photo_params)
        photo.save
        return photo
    end
end