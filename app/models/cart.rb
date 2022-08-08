class Cart < ApplicationRecord
  belongs_to :user

  has_many :cart_items
  has_many :items, through: :cart_items

  def total
    sum = 0
    cart_items.find_each do |cart_item|
      sum += cart_item.item.price * cart_item.quantity
    end
    sum
  end
end
