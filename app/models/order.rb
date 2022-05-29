class Order < ApplicationRecord
  has_many :order_items, foreign_key: :order_id, class_name: "OrderItem"
  belongs_to :assigned_user, foreign_key: :assigned_user_id, class_name: "User"
end
