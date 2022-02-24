class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  geocoded_by :address

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, length: { minimum: 5 }
  after_validation :geocode, if: :will_save_change_to_address?
  has_one_attached :photo
  has_many :animals, dependent: :destroy
  has_many :bookings, dependent: :destroy
end
