class RenameGenreIdColumnToMytrips < ActiveRecord::Migration[5.2]
  def change
  	change_column :mytrips, :genre_id, :string
  	rename_column :mytrips, :genre_id, :region
  end
end
