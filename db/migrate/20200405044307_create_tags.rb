class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.integer :mytrip_id

      t.timestamps
    end
  end
end
