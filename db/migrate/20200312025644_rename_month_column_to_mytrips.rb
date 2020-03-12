class RenameMonthColumnToMytrips < ActiveRecord::Migration[5.2]
  def change
  	rename_column :mytrips, :month, :date
  end
end
