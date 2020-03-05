class AddGenderToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :gender, :boolean
  end
end
