class CreateConnections < ActiveRecord::Migration[7.0]
  def change
    create_table :connections do |t|
      t.references :student, index: true
      t.references :course, index: true
      t.references :batch, index: true
      t.references :school, index: true
      t.boolean :status, null: false, default: false
      t.timestamps
    end
    add_foreign_key :connections, :users, column: :student_id
  end
end
