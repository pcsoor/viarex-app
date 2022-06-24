class OrderItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order_item, only: [:destroy, :update, :edit]

  def new
    @order = current_order
    @order_item = @order.order_items.new
    @order_item.build_board
    # byebug
  end

  def create
    @order = active_order
    @order_item = @order.order_items.new(order_item_params)

    respond_to do |format|
      if @order_item.save

        format.html do
          redirect_to new_order_item_path
          flash[:success] = "Tétel siekresen hozzáadva."
        end
        format.js
      else
        format.html { render :json => @order_item.errors }
        format.js
      end
    end
  end

  def edit
  end

  def update
    if @order_item.update(order_item_params)
      redirect_to new_order_item_path, notice: "Tétel frissítve."
    else
      render 'edit'
    end
  end

  def destroy
    if @order_item.destroy
      flash[:success] = "Elem sikeresen törölve."
      redirect_to new_order_item_path
    end
  end

  private

  def set_order_item
    @order_item = OrderItem.find(params[:id])
  end

  def order_item_params
    params.require(:order_item).permit(:id, :assigned_order_id, :quantity, :notice, :description,
                                       :board_attributes => [:id, :order_item_id, :board_type_id, :banding_long_1_id, :banding_long_2_id,
                                                             :banding_short_1_id, :banding_short_2_id,
                                                             :vein, :length, :width])
  end
end
