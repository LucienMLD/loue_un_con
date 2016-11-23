class Performance < ApplicationRecord
  has_attachment :photo
  belongs_to :user
  has_many :bookings
  validates :speciality, presence: true, allow_blank: false
  validates :price, presence: true, allow_blank: false
  validates :area, presence: true, allow_blank: false
  validates :name, presence: true, allow_blank: false
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

end
