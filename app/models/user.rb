class User < ApplicationRecord
  has_many :orders, foreign_key: :user_id, class_name: "Order"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
