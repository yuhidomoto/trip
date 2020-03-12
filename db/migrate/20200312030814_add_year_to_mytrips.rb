class AddYearToMytrips < ActiveRecord::Migration[5.2]
  def change
    add_column :mytrips, :year, :integer
    rename_column :mytrips, :date, :month
  end
end
