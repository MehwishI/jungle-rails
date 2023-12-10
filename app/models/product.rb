class Product < ApplicationRecord
  attr_accessor :name, :price, :category, :quantity
  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category 
  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true
end
