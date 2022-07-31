class Brand < ApplicationRecord
  has_many :items, dependent: :destroy
  validates_uniqueness_of :name

  def self.search_by_name(search)
    Brand.where('LOWER(name) LIKE :search', search: "%#{search.downcase}%").order(:name).pluck(:name, :id)
  end
end
