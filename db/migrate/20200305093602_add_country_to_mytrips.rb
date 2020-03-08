class AddCountryToMytrips < ActiveRecord::Migration[5.2]
  def change
    add_column :mytrips, :country, :string
  end
end
