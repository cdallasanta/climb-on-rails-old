class CreateRopes < ActiveRecord::Migration[5.2]
  def change
    create_table :ropes do |t|
      t.string :primary_identifier
      t.string :secondary_identifier
      t.integer :element_id

      t.timestamps
    end
  end
end
