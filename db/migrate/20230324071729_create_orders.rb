class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :user_id
      t.float :total
      t.boolean :complete
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      
      t.timestamps
    end
  end
end
