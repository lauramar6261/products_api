class ProductsController < ApplicationController
  def show
    product = Product.find_by(id: params[:id])

    if product
      render json: product.as_json(only: [:id, :upc, :name, :image, :date, :notes, :description, :color, :brand]), status: :ok
    else
      render json: {ok: false, message: 'product not found'}, status: :not_found
    end
  end

  def index
    products = Product.all
    if products.nil?
      render json: {ok:false, message: 'not_found'}, status: :not_found
    else
      render json: products.as_json(only: [:id, :upc, :name, :image, :date, :notes, :description, :color, :brand]), status: :ok
    end
  end

  def create
    # need to find out if the user doesn't input anything, will it be strings or nil? (I think string, if I set the state as strings from the beginning)
    if product_params[:date] = "" && !product_params[:pao].nil? && product_params[:pao] != ""
      product_params[:date] = Date.today + (30 * product_params[:pao].to_f)
    end
    product = Product.new(product_params)

   if product.save
     render json: product.as_json(only: [:id]), status: :ok
   else
     render json: {ok: false, message: product.errors.messages}, status: :bad_request
   end
  end

  def edit
  end

  def update
  end

  def destroy
  end

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
     params.permit(:name, :image, :date, :notes, :description, :brand, :color, :upc, :pao)
  end
end
