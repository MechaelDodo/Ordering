# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'yaml'

seed_file = Rails.root.join('db',  'menu.yml')
config = YAML::load_file(seed_file)
config["ingredients"].each do |name|
  Ingredient.create!(name: name)
end
config["dishes"].each do |dish|
  d = Dish.create(name: dish["name"])
  d.ingredients << Ingredient.where(name: dish["ingredients"])
end