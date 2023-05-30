class Product < ApplicationRecord
    has_many :order_items
    has_many :orders, through: :order_items
    belongs_to :user

end 