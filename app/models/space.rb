class Space < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: 'user_id'
  has_many :bookings
  has_many :users, through: :bookings

  validates :location, presence: true
  validates :category, presence: true, inclusion: { in: ["Music recording studio", "Music rehearsal room", "Dance studio", "General rehearsal space", "Artist studio"] }
  validates :title, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
