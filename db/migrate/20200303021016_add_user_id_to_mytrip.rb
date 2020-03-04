class AddUserIdToMytrip < ActiveRecord::Migration[5.2]
  def change
    add_column :mytrips, :user_id, :integer
    add_column :mytrips, :genre_id, :integer
    add_column :mytrips, :image_id, :string
    add_column :mytrips, :countory, :string
    add_column :mytrips, :time_difference, :number
    add_column :mytrips, :flight_time, :string
    add_column :mytrips, :airline, :string
    add_column :mytrips, :airline_comment, :text
    add_column :mytrips, :days, :string
    add_column :mytrips, :month, :number
    add_column :mytrips, :season, :string
    add_column :mytrips, :total_price, :string
    add_column :mytrips, :climate, :text
    add_column :mytrips, :prices, :text
    add_column :mytrips, :security, :text
    add_column :mytrips, :traffic, :text
    add_column :mytrips, :bathroom, :text
    add_column :mytrips, :card, :text
    add_column :mytrips, :language, :text
    add_column :mytrips, :tip, :text
    add_column :mytrips, :with_whom, :text
    add_column :mytrips, :must, :text
    add_column :mytrips, :good_point, :text
    add_column :mytrips, :bad_point, :text
    add_column :mytrips, :important, :text
    add_column :mytrips, :address, :text
    add_column :mytrips, :latitude, :float
    add_column :mytrips, :longitude, :float

  end
end
