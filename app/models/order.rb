class Order < ApplicationRecord
  has_many :order_dishes
  has_many :dishes, through: :order_dishes
end
