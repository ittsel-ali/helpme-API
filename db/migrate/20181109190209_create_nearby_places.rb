class CreateNearbyPlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :nearby_places do |t|
      t.string :google_place_id
      t.string :google_place_lat
      t.string :google_place_lng

      t.references :user_location
      t.timestamps
    end
  end
end
