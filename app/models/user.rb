class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: %i[student school_admin admin]
  has_many :connections, dependent: :destroy, foreign_key: 'student_id'
  has_many :courses, through: :connections
  has_many :batches, through: :connections
  has_one :own_school, foreign_key: 'owner_id', class_name: 'School', dependent: :destroy
  has_many :schools, through: :connections
  scope :available_school_admin, -> { where(role: 'school_admin') }
  scope :available_student, -> { where(connections: { status: true }) }
end
