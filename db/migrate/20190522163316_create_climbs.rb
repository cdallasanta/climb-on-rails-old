class CreateClimbs < ActiveRecord::Migration[5.2]
  def change
    create_table :climbs do |t|
      t.integer :rope_id
      t.integer :preuse_inspection_id
      t.integer :number_of_climbs

      t.timestamps
    end
  end
end
