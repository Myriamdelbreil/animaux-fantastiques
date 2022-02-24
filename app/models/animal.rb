class Animal < ApplicationRecord
  CATEGORIES = ["Acromentula", "Centaur", "Dragon", "Hippogryph", "Leprechaun", "Phoenix", "Troll", "Unicorn", "Were-wolf"]
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :name, :description, :price, :category, presence: true
  validates :category, inclusion: { in: CATEGORIES }
  has_many_attached :photos
end
