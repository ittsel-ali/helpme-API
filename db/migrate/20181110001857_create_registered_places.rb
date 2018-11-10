class CreateRegisteredPlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :registered_places do |t|
      t.string :name
      t.string :lat
      t.string :lng
      t.string :google_place_id

      t.timestamps
    end
  end
end
