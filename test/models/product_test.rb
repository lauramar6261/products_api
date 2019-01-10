require 'test_helper'

class ProductsTest < ActiveSupport::TestCase
    let (:product) {products(:one)}
    let (:producttwo) {products(:two)}

    describe "validations" do
      it "requires a name" do
        product.name = nil
        product.valid?. must_equal false
        product.errors.messages.must_include :name
      end

      it "requires an UPC" do
        product.upc = nil
        product.valid?.must_equal false
        product.errors.messages.must_include :upc
      end

      it "requires image" do
        product.image = nil
        product.valid?.must_equal false
        product.errors.messages.must_include :image
      end
    end

    describe "overdue" do
    it "returns all overdue products" do
      productoverdue = Product.find_by(id: 3)
      productoverdue.date.must_be :<, Date.today

      overdue = Product.overdue
      overdue.length.must_equal 1
      overdue.first.must_equal productoverdue
    end

    it "returns an empty array if no products are overdue" do
      r = Product.first
      r.date = Date.today
      r.save!
      Product.overdue.length.must_equal 0
    end
  end
end
