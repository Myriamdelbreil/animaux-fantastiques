class Animal < ApplicationRecord
  CATEGORIES = ["Acromentula", "Centaur", "Dragon", "Hippogryph", "Leprechaun", "Phoenix", "Troll", "Unicorn", "Werewolf"]
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :name, :description, :price, :category, presence: true
  validates :category, inclusion: { in: CATEGORIES }
  has_many_attached :photos

  include PgSearch::Model
  pg_search_scope :search_by_category,
    against: [ :category ],
    using: {
      tsearch: { prefix: true }
    }

    pg_search_scope :search_by_price,
    against: [ :price ],
    using: {
      tsearch: { prefix: true }
    }
end
