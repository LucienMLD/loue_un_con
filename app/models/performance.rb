class Performance < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :speciality, presence: true, allow_blank: false
  validates :price, presence: true, allow_blank: false
  validates :price, presence: true, allow_blank: false
  validates :area, presence: true, allow_blank: false
  validates :name, presence: true, allow_blank: false

end
