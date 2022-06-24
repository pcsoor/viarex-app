class Order < ApplicationRecord
  has_many :order_items, foreign_key: :order_id, class_name: "OrderItem", :dependent => :destroy
  belongs_to :assigned_user, foreign_key: :user_id, class_name: "User"

  enum status: {
    draft: 0,
    delivered: 1,
    completed: 2,
    deleted: 3
  }
end
