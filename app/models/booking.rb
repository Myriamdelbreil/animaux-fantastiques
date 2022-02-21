class Booking < ApplicationRecord
  belongs_to :user_id
  belongs_to :animal_id

  validates :total_price, :start_date, :end_date, presence: true
end
