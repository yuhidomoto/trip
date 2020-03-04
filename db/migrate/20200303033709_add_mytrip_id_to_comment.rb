class AddMytripIdToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :mytrip_id, :integer
    add_column :comments, :user_id, :integer
  end
end
