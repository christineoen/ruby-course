class OrdersController < ApplicationController

  def index
    # @orders = DoubleDog::SeeAllOrders.run(order_params)
  end

  def show
    @item_quantity_hash = {}
    @item_price_hash = {}
    @order = DoubleDog.db.get_order(params[:id])
    @order.items.each do |item|
      @item_quantity_hash[item.name] ||= 0
      @item_quantity_hash[item.name] += 1
      @item_price_hash[item.name] = item.price
    end
  end

  def new
    @items = DoubleDog.db.all_items
  end

  def create
    order_params = {:session_id => $session_id, :items => []}

    params['order'].each do |item|
      id = item[0].to_i
      db_item = DoubleDog.db.get_item(id)
      quantity = item[1]['quantity'].to_i
      
      quantity.times do |item|
        order_params[:items] << db_item
      end
    end

    order = DoubleDog::CreateOrder.new.run(order_params)

    redirect_to "/orders/#{order[:order].id}"
  end

  private
  # def order_params
    # params.require(:order).permit(:employee_id, :items)
  # end

end
