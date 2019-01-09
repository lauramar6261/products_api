require 'test_helper'

class ProducTest < ActiveSupport::TestCase
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
end
