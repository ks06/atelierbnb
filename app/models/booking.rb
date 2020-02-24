class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :space

  validates_uniqueness_of :time, scope: [:date, :space_id]
  validates_uniqueness_of :date, scope: :space_id
end
