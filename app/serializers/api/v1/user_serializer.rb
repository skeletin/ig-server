class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :birth_date, :username, :full_name

  def attributes(*args)
    hash = super
    hash.transform_keys { |key| key.to_s.camelize(:lower).to_sym }
  end
end