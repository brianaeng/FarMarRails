class ProductController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    find
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new

    @product.name = params[:product][:name]
    @product.vendor_id = params[:product][:vendor_id]

    @product.save
  end

  def edit
    find
  end

  def update
    find

    @product.name = params[:product][:name]
    @product.vendor_id = params[:product][:vendor_id]

    @product.save
  end

  def destroy
    find
    @product.destroy
  end

  private
  def find
    @product = Product.find(params[:id].to_i)
  end
end
