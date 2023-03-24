class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.float :price
      t.string :image_url
      t.boolean :sold
      t.string :buyer

      t.timestamps
    end
  end
end


