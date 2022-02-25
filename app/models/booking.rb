class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :animal
  after_initialize :set_defaults
  validates :start_date, :end_date, presence: true
  validates :status, inclusion: { in: ["approved!", "denied", "pending..."] }

  def set_defaults
    self.status ||= "pending..."
  end
end
