class Item < ApplicationRecord
  belongs_to :brand

  has_many :favorites
  has_many :cart_items

  validates_uniqueness_of :name
  validates_presence_of :name, :price, :quantity
  validates_numericality_of :price, greater_than: 0.0

  enum condition: {
    brand_new: 0,
    like_new: 1,
    good: 2,
    used: 3,
    fair: 4,
    poor: 5
  }
end
