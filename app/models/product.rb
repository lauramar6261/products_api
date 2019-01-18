class Product < ApplicationRecord
  validates :name, :upc, :image, presence: true
  validates :upc, uniqueness: true

  validate :expiration_date_cannot_be_in_the_past,
  def self.overdue
    self.where("date < ?", Date.today)
  end

  def expiration_date_cannot_be_in_the_past
    errors.add("expiration date must be in the future") if
      !date.blank? and expiration_date <= Date.today
  end
end
