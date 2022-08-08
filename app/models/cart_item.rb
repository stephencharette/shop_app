class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :item

  has_one :brand, through: :item

  validate :foo

  def foo
    errors[:base] << 'HELLO WORLD' if item.cart_items.sum(:quantity) >= item.quantity
  end
end
