class Product < ApplicationRecord
  validates :name, :upc, :image, presence: true
  belongs_to :user
  def self.overdue
    self.where("date < ?", Date.today)
  end
end
