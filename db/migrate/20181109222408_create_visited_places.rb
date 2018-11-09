class CreateVisitedPlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :visited_places do |t|
      t.boolean :active?, default: false, null: false

      t.references :user
      t.references :registered_place

      t.timestamps
    end
  end

end
