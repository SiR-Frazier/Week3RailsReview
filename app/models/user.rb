class User < ApplicationRecord
  has_secure_password
  has_many :orders
  # validates :email, presence: true, uniqueness: true
  validates :password_digest, length: { minimum: 8 },  on: :create 


  def previous_orders
    self.orders.where(status: 2).includes(order_items: :product)
  end
end
