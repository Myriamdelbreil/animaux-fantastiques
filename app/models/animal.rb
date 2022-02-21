class Animal < ApplicationRecord
  belongs_to :user
  validates :name, :description, :price, :category, presence: true
end
