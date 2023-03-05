class CreateSchools < ActiveRecord::Migration[7.0]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :address
      t.references :owner, index: true
      t.timestamps
    end
    add_foreign_key :schools, :users, column: :owner_id
  end
end
