class AddTimestampsToRants < ActiveRecord::Migration
  def change
    add_timestamps(:rants)
  end
end
