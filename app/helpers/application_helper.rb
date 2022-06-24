module ApplicationHelper
  def active_order
    order = current_user.orders.where(active: true).first
    order
  end

  def current_order
    if active_order
      active_order
    else
      order = Order.new
      order.assigned_user = current_user
      order.active = true
      order.save
      order
    end

  end

  def bootstrap_class_for(flash_type)
    {
      success: "alert-success",
      error: "alert-danger",
      alert: "alert-warning",
      notice: "alert-info"
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def current_class?(path)
    return 'active' if request.path == path
    ''
  end
end
