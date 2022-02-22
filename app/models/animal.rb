class Animal < ApplicationRecord
  CATEGORIES = ["Acromentule", "Centaure", "Dragon", "Farfadet", "Hippogriffe", "Licorne", "Loup-Garou", "Phénix", "Troll"]
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :name, :description, :price, :category, presence: true
  validates :category, inclusion: { in: CATEGORIES }
  has_one_attached :photo
end
