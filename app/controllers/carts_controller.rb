class CartsController < ApplicationController

  def checkout
    cart = Cart.find(params[:id])
    @order = Order.create_from_cart(cart)
    @order.change_order_status
    @order.change_inventory
    session[:cart_id] = nil

    redirect_to order_path(@order), notice: 'Thanks for you order!'
  end

end