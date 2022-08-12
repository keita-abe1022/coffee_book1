class Coffee < ApplicationRecord
  validates :product_name, presence: true, length: { maximum: 50 }
  validates :producing_area, length: { maximum: 50 }
  validates :price, numericality: true
  validates :weight, numericality: true
  # validates :purchashing_system, presence: true
  # validates :degree_of_roasting
  # validates :grind
  # validates :brew
  validates :shop, presence: true
  validates :comment, length: { maximum: 200 }
end
