class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]
  before_action :get_all_dishes, only: %i[ new ]
  before_action :get_all_ingredients, only: %i[ new ]

  # GET /orders or /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    if params[:commit] == "Search"
      @dishes = Ingredient.where(name: params.select {|k,v| v=="1"}.keys).map {|i| p i.dishes}.inject(:&)
      @dishes = [] if @dishes.nil?
    end
    @order = Order.new
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new
    ActiveRecord::Base.transaction do
      raise ActiveRecord::TransactionIsolationError if dishes_counts_from_params.blank?
      respond_to do |format|
        if @order.save
          dishes_counts_from_params.each do |dish_id, count|
            OrderDish.create!(order_id: @order.id, dish_id: dish_id.to_i, count: count)
          end
          format.html { redirect_to "/", notice: "Order was successfully created." }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end
    end
  rescue ActiveRecord::TransactionIsolationError => e
    format.html { redirect_to new_order_path, status: :unprocessable_entity }
    format.json { render json: e, status: :unprocessable_entity }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.fetch(:order, {})
    end

    def get_all_dishes
      @dishes = Dish.all
    end

    def get_all_ingredients
      @ingredients = Ingredient.all
    end

  def dishes_counts_from_params
    params.require(:dishes).to_unsafe_h.select {|k,v| v.to_i>0}
  end

end

