class SalesController < ApplicationController
  def index
    @sales = Sale.all
  end

  def show
    find
  end

  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new

    @sale.amount = params[:sale][:amount]
    @sale.purchase_time = params[:sale][:purchase_time] 
    @sale.vendor_id = params[:sale][:vendor_id]
    @sale.product_id = params[:sale][:product_id]

    @sale.save

    redirect_to sales_url
  end

  def edit
    find
  end

  def update
    find

    @sale.amount = params[:sale][:amount]
    @sale.purchase_time = params[:sale][:purchase_time]
    @sale.vendor_id = params[:sale][:vendor_id]
    @sale.product_id = params[:sale][:product_id]
    @sale.save

    redirect_to sales_url
  end

  def destroy
    find

    @sale.destroy
  end

  private
  def find
    @sale = Sale.find(params[:id].to_i)
  end
end
