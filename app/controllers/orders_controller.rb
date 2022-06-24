class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:show]

  def index
    @draft_order = current_user.orders.find_by(active: true)
    @delivered_orders = current_user.orders.where(status: Order.statuses[:delivered])
  end

  def show
  end

  def submit
    @order = active_order
    Time.zone = "Budapest"

    if @order.order_items.count > 0
      if @order.update(status: Order.statuses[:delivered], ordered_at: DateTime.now.in_time_zone, active: false)
        flash[:success] = "Rendelés sikeresen leadva!"
        redirect_to action: "index"
      else
        redirect_to new_order_item_path, notice: orders.errors.full_messages
      end
    else
      flash[:error] = "Nincs tétel a listában!"
      redirect_to new_order_item_path
    end
  end

  private

  def set_order
    @order = Order.find_by(id: params[:id])
  end
end
