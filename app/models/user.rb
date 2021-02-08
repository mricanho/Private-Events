class User < ApplicationRecord
  has_many :events, foreign_key: :user_id, class_name: 'Event'
  has_many :attendances
  has_many :attended_events, through: :attendances, source: :event

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  scope :upcoming, -> { where('date >= ?', Date.today) }
  scope :past, -> { where('date < ? ', Date.today) }
end
