class Api::V1::PostSerializer < ActiveModel::Serializer
    attributes :id, :image_url, :caption
    include Rails.application.routes.url_helpers
  
    def attributes(*args)
      hash = super
      hash.transform_keys { |key| key.to_s.camelize(:lower).to_sym }
    end

    def image_url
        url_for(object.image)
    end
end