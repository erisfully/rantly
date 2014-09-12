class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users_tables do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :password_digest
      t.text :bio
      t.string :frequency

      t.timestamps
    end
  end
end
