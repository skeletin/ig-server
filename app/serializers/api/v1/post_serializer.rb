class Api::V1::PostSerializer < ActiveModel::Serializer
    attributes :id, :image_url, :caption, :date
    include Rails.application.routes.url_helpers
  
    def attributes(*args)
      hash = super
      hash.transform_keys { |key| key.to_s.camelize(:lower).to_sym }
    end

    def image_url
        object.image.present? ? url_for(object.image) : nil
    end

    def date
        object.created_at.strftime("%B %d")
    end
end