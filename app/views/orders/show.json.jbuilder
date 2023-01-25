json.array! @order.order_dishes.each do |ord_d|
  json.name Dish.find(ord_d.dish_id).name
  json.count ord_d.count
end

