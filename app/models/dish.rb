class Dish < ApplicationRecord
  has_many :order_dishes
  has_many :orders, through: :order_dishes
  has_and_belongs_to_many :ingredients

  def get_string_ingredients
    self.ingredients.map{|i| i.name}.join(", ")
  end
end
