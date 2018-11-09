class CreateUserLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :user_locations do |t|
      t.string :lat
      t.string :lng

      t.references :user
      t.timestamps
    end
  end
end
