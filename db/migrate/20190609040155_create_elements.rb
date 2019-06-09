class CreateElements < ActiveRecord::Migration[5.2]
  def change
    create_table :elements do |t|
      t.string :name
      t.integer :site_id
      t.text :preuse_equipment_instructions
      t.text :preuse_element_instructions
      t.text :preuse_environment_instructions
      t.text :periodic_equipment_instructions
      t.text :periodic_element_instructions
      t.text :periodic_environment_instructions

      t.timestamps
    end
  end
end
