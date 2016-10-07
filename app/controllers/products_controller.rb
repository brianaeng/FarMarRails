class ProductsController < ApplicationController
  before_filter :set_search

  def index
    # @products = Product.all
    @products = Product.all

    if !params[:q].blank?
      @results = Product.search(params[:q])
      @products = @results.result
    elsif params[:q].blank?
      @results = Product.search({:id_eq => 0})
      @products = @results.result
    end
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
