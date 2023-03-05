class School < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  has_many :batches, dependent: :destroy
  has_many :users, through: :batches
  has_many :connections, dependent: :destroy
  has_many :courses, through: :connections
  has_many :students, through: :connections, class_name: 'User', foreign_key: 'student_id'
  validates :name, :address, presence: true
  scope :student_school, -> { includes(:owner).where(connections: { status: true }) }
  scope :available_school, ->(owner_id) { where(owner_id:) }
end
