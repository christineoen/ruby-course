class ItemsController < ApplicationController

  def index
    @items = DoubleDog.db.all_items
  end

  def create
    i_params = item_params.merge(:session_id => $session_id)
    i_params[:price] = i_params[:price].to_f
    item = DoubleDog::CreateItem.new.run(i_params)
    redirect_to :back
  end

  private
  def item_params
    params.require(:item).permit(:name, :price)
  end

end
