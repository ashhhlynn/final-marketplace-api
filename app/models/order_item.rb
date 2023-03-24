class OrderItem < ApplicationRecord 
    belongs_to :product
    belongs_to :order
    validates :order_id, presence: true 
 end