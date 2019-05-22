class CreateElements < ActiveRecord::Migration[5.2]
  def change
    create_table :elements do |t|
      t.string :name
      t.integer :site_id

      t.timestamps
    end
  end
end
