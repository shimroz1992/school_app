class Connection < ApplicationRecord
  belongs_to :student, class_name: 'User', foreign_key: 'student_id'
  belongs_to :course, optional: true
  belongs_to :batch, optional: true
  belongs_to :school, optional: true
  scope :school_admin_connection, lambda { |school_id|
                                    includes(%i[course batch student school]).where(status: false, school_id:)
                                  }
  scope :student_connection, lambda { |student_id|
                               includes(%i[course batch student school]).where(student_id:)
                             }
  scope :progress_month, ->(course_id) { find_by(course_id:) }
end
