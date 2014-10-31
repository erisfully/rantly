class AddFavoritesCountToRants < ActiveRecord::Migration
  def change
    add_column :rants, :favorites_count, :integer, default: 0
  end
end
