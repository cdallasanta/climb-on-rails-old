class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :fullname
      t.string :nickname
      t.string :email
      t.string :role
      t.string :password_digest
      t.string :site

      t.timestamps
    end
  end
end
