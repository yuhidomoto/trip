class ChangeColumnsFromMytrips < ActiveRecord::Migration[5.2]
  def change
    change_column :mytrips, :time_difference, :integer
    change_column :mytrips, :month, :integer
  end
end
