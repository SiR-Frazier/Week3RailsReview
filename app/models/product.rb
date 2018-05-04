class Product < ApplicationRecord
  has_many :order_items
  validates_presence_of :price #necessary?
end
