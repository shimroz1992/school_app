class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :sub_name
      t.time :start_at
      t.time :end_at
      t.string :fees
      t.string :tutor_name
      t.string :course_duration
      t.string :description
      t.references :batch, index: true
      t.timestamps
    end
  end
end
