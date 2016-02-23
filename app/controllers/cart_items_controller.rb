class CartItemsController < ApplicationController

  def create
    @item = Item.find(params[:item_id])
    cart.add_item(@item)
    session[:cart] = cart.data
    redirect_to store_path
  end

  def index
    @cart_items = cart.items
  end

  def destroy
    @item = Item.find(params[:item_id])
    cart.remove_item(@item.id)
    redirect_to cart_path
    flash[:notice] = "Item removed from cart"
  end

  def update
    @item = Item.find(params[:item_id])
    cart.update_item(@item.id, params[:quantity])
    redirect_to cart_path
    flash[:notice] = "Your cart has been updated"
    count
  end

  def count
    cart.data.keys.count
  end

end
