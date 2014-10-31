class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :rant_id
      t.integer :user_id
    end
  end
end
