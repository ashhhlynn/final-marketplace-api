class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.string :order_id
      t.string :product_id
      t.float :price
      t.string :title
      t.string :seller
      t.timestamps
    end
  end
end
