class CreatePreuseInspections < ActiveRecord::Migration[5.2]
  def change
    create_table :preuse_inspections do |t|
      t.datetime :date
      t.integer :element_id
      t.integer :user_id
      t.text :comments

      t.timestamps
    end
  end
end
