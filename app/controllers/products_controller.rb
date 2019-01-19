class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]
  # GET /products/:id
  def show
    if @product
      render json: @product.as_json(only: [:id, :upc, :name, :image, :date, :notes, :description, :color, :brand, :pao]), status: :ok
    else
      render json: {ok: false, message: 'product not found'}, status: :not_found
    end
  end

   # GET /products
  def index
    products = Product.all.sort_by{|product| product.date}
    if products.nil?
      render json: {ok:false, message: 'not_found'}, status: :not_found
    else
      render json: products.as_json(only: [:id, :upc, :name, :image, :date, :notes, :description, :color, :brand, :pao]), status: :ok
    end
  end

  # POST /products
  def create
    # parameters that have empty string as their values, get
    # their key removed durign the execution of Product.new
    # Once Product.new is done executing, it adds all the keys from the model
    # and it sets the values of nil for the ones that were missing or had an empty string
    product = Product.new(product_params)
    if product.date.nil? && !product.pao.nil? && product.pao != ""
      product.date = Date.today + (30 * product.pao.to_f)
    end

   if product.save
     render json: product.as_json(only: [:id, :date]), status: :ok
   else
     render json: {ok: false, message: product.errors.full_messages}, status: :bad_request
   end
  end

  # PUT /products/:id
  def update
    if @product.update!(product_params)
      render json: @product.as_json(only: [:id, :upc, :name, :image, :date, :notes, :description, :color, :brand]), status: :ok
    else
      render json: {ok: false, message: 'product not found'}, status: :not_found
    end
  end

  # DELETE /products/:id
  def destroy
    if @product.destroy!
      render json: @product.as_json(only: [:id]), status: :ok
    else
      render json: {ok: false, message: 'product not found'}, status: :not_found
    end
  end

  # GET /products/overdue
  def overdue
    products = Product.overdue.map do |product|
      {
          name: product.name,
          image: product.image,
          upc: product.upc,
          date: product.date,
          notes: product.notes,
          description: product.description,
          brand: product.brand,
          color: product.color
      }
    end
    render status: :ok, json: products
  end

  def zomg
    render json: {message: "it works!"}, status: :ok
  end

  private

  def product_params
     params.permit(:name, :image, :date, :notes, :description, :brand, :color, :upc, :pao, :user_id)
  end

  def set_product
    @product = Product.find_by(upc: params[:upc])
    unless @product
      render status: :not_found, json: { errors: { upc: ["No such product with upc #{params[:upc]}"] } }
    end
  end
end
