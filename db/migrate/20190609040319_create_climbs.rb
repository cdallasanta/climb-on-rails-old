class CreateClimbs < ActiveRecord::Migration[5.2]
  def change
    create_table :climbs do |t|
      t.integer :number_of_climbs
      t.integer :climbing_block
      t.integer :rope_id
      t.integer :takedown_id
    end
  end
end
