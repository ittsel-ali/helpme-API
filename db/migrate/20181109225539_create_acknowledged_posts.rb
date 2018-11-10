class CreateAcknowledgedPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :acknowledged_posts do |t|
      t.references :post
      t.references :visitor

      t.timestamps
    end
  end
end
