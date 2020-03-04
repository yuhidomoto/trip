class CreateMytrips < ActiveRecord::Migration[5.2]
  def change
    create_table :mytrips do |t|

      t.timestamps
    end
  end
end
