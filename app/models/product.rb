class Product < ApplicationRecord
  validates :name, :upc, :image, presence: true
end
