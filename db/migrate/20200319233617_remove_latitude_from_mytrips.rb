class RemoveLatitudeFromMytrips < ActiveRecord::Migration[5.2]
  def change
    remove_column :mytrips, :latitude, :float
  end
end
