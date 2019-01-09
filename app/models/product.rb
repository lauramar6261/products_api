class Product < ApplicationRecord
  validates :name, :upc, :image, presence: true

  def self.overdue
    self.where("date < ?", Date.today)
  end
end
