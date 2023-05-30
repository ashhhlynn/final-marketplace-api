class OrderSerializer < ActiveModel::Serializer
    attributes :user_id, :id, :total, :updated_at, :complete
    has_many :order_items
    has_many :products, through: :order_items
    
    belongs_to :user
end