class ProductsController < ApplicationController
  def index
    @products = Product.all

    @search_product = Product.search(params[:q])
    @products = @search_product.result
    @search_product.build_condition
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

    redirect_to controller: 'vendors', action: 'show', id: @product.vendor.id
  end

  def edit
    find
  end

  def update
    find

    @product.name = params[:product][:name]
    @product.vendor_id = params[:product][:vendor_id]

    @product.save

    redirect_to controller: 'vendors', action: 'show', id: @product.vendor.id
  end

  def destroy
    find
    @product.destroy

    redirect_to controller: 'vendors', action: 'show', id: @product.vendor.id
  end

  private
  def find
    @product = Product.find(params[:id].to_i)
  end
end
