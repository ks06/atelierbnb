class Space < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: 'user_id'
  has_many :bookings
  has_many :users, through: :bookings

  has_many_attached :photos

  validates :location, presence: true
  validates :category, presence: true, inclusion: { in: ["Music recording studio", "Music rehearsal room", "Dance studio", "General rehearsal space", "Artist studio"] }
  validates :title, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :photos, presence: true

  include PgSearch::Model
  pg_search_scope :search_errthang,
    against: [ :location, :category, :description, :title ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

end

