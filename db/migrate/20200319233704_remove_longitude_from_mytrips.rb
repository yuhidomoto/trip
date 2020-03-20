class RemoveLongitudeFromMytrips < ActiveRecord::Migration[5.2]
  def change
    remove_column :mytrips, :longitude, :float
  end
end
