class CreateBatches < ActiveRecord::Migration[7.0]
  def change
    create_table :batches do |t|
      t.integer :max_count
      t.string :name
      t.references :school, index: true
      t.timestamps
    end
  end
end
