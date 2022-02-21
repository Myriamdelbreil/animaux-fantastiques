class Animal < ApplicationRecord
  belongs_to :user
  validates :name, :description, :price, :category, presence: true
  has_one_attached :photo
end
