class CreateUserTakedownss < ActiveRecord::Migration[5.2]
  def change
    create_table :user_takedownsses do |t|
      t.integer :user_id
      t.integer :takedown_id
    end
  end
end
