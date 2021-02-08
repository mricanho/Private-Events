class Event < ApplicationRecord
  belongs_to :user
  has_many :attendances
  has_many :attendee, through: :attendances, source: :user

  validates :title, presence: true
  validates :event, presence: true

  scope :upcoming, -> { where('date >= ?', DateTime.now) }
  scope :past, -> { where('date < ? ', DateTime.now) }
end
