class AddContactToSite < ActiveRecord::Migration[5.2]
  def change
    add_column :sites, :contact_id, :integer
  end
end
