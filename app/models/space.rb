class Space < ApplicationRecord
  belongs_to :owner, source: :user
  has_many :bookings
  has_many :users, through: :bookings

  validates :location, presence: true
  validates :type, presence: true, acceptance: { accept: %w[music_recording_studio music_rehearsal_room dance_studio general_rehearsal_space artist_studio] }
end
