class Product < ApplicationRecord
  validates :name, :upc, :image, presence: true
  validates :upc, uniqueness: true
  def self.overdue
    self.where("date < ?", Date.today)
  end
end
