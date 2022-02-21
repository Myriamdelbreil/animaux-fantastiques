class Animal < ApplicationRecord
  belongs_to :user
  validates :name, :description, :price, :category, presence: true
  validates :category, inclusion: {in: ["Acromentule", "Augurey", "Botruc", "Centaure", "Dragon", "Farfadet", "Hippogriffe", "Licorne", "Loup-Garou", "Phénix", "Troll"]}
  has_one_attached :photo
end
