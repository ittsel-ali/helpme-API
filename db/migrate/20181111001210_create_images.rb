class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :file
      t.string :image_type

      t.references :imagable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
