class OrdersController < ApplicationController
  def index
  end

  def new
    @order_item = current_order.order_items.new
    @order_item.boards.new
  end

  def create
    @order = current_order
    @order_item = @order.order_items.new(order_params)

    respond_to do |format|
      if @order_item.save
        format.html { redirect_to "/orders/new" }
        format.js
      else
        format.html do
          render "new"
        end
        format.json do
          render json: @order_item.errors
        end
      end
    end
    session[:order_id] = @order.id
  end

  private

  def order_params
    params.require(:order_item).permit(:id, :quantity, :notice, :description,
                                  :boards_attributes => [:id, :board_type_id, :banding_long_1_id, :banding_long_2_id,
                                                         :banding_short_1_id, :banding_short_2_id,
                                                         :vein, :length, :width])
  end
end
