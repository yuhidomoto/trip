class RemoveTimeDifferenceFromMytrips < ActiveRecord::Migration[5.2]
  def change
    remove_column :mytrips, :time_difference, :integer
  end
end
