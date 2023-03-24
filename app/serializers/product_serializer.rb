class ProductSerializer < ActiveModel::Serializer
    attributes :title, :price, :id, :description, :sold, :buyer, :image_url, :user_id, :created_at
    has_many :order_items
end