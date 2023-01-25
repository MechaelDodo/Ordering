class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.timestamps
    end
    create_table :dishes do |t|
      t.string :name
    end
    create_table :order_dishes do |t|
      t.belongs_to :dish
      t.belongs_to :order
      t.integer :count
      t.timestamps
    end
  end
end
