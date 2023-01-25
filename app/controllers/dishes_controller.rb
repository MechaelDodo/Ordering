class DishesController < ApplicationController
  before_action :set_dish, only: %i[ show  ]

  def show
  end

  private
    def set_dish
      @dish = Dish.find(params[:id])
    end
end
