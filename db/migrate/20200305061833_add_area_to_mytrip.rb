class AddAreaToMytrip < ActiveRecord::Migration[5.2]
  def change
    add_column :mytrips, :area, :string
  end
end
