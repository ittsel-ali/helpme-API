class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|

      t.references :placeable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
