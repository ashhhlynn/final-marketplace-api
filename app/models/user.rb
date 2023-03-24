class User < ApplicationRecord
    has_many :orders, -> { where complete: true }
    has_many :products, -> { order 'sold ASC'}
    has_secure_password
    validates :email, uniqueness: { case_sensitive: false }
    validates :name, length: { maximum: 50 }
    validates :address, length: { maximum: 100 }
    validates :city, length: { maximum: 50 }
    validates :state, length: { maximum: 50 }
    validates :zip, length: { maximum: 20 }
end
