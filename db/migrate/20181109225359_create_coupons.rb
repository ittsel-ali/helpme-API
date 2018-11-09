class CreateCoupons < ActiveRecord::Migration[5.2]
  def change
    create_table :coupons do |t|
      t.string :code
      t.boolean :redeemed?, default: false, null: false

      t.references :couponable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
