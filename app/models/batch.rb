class Batch < ApplicationRecord
  belongs_to :school
  has_many :courses, dependent: :destroy
  has_many :connections, dependent: :destroy
  has_many :students, through: :connections, class_name: 'User', foreign_key: 'student_id'
  validates :name, :max_count, presence: true
  scope :student_batch, -> { includes([:school]).where(connections: { status: true }) }
  scope :school_admin_batch, ->(school_id) { includes([:school]).where(school_id:) }
  scope :available_batch, ->(school_id) { where(school_id:) }
end
