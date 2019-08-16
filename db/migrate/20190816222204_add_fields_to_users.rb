class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :role, :string
    add_column :users, :site_id, :integer
    add_column :users, :fullname, :string
  end
end
