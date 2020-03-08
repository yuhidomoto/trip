class ChangeDataMonthToMytrips < ActiveRecord::Migration[5.2]
  def change
  	change_column :mytrips, :month, :integer
  	change_column :mytrips, :time_difference, :integer
  end
end
