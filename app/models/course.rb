class Course < ApplicationRecord
  belongs_to :batch
  has_many :connections, dependent: :destroy
  has_many :students, through: :connections, class_name: 'User', foreign_key: 'student_id'
  validates :name, :sub_name, :start_at, :end_at, :fees, :tutor_name, :course_duration, :description, presence: true

end
