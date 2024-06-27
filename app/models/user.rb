class User < ApplicationRecord
  # Associations
  has_secure_password
  has_many :posts, dependent: :destroy
  has_one_attached :avatar

  # Validations
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  validates :username, presence: true, uniqueness: true
  validates :full_name, presence: true
  validates :birth_date, presence: true
end