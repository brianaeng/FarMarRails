class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all

    @search_vendor = Vendor.search(params[:q])
    @vendors = @search_vendor.result
    @search_vendor.build_condition
  end

  def show
    find
  end

  def show_sales
    find
  end

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new

    @vendor.name = params[:vendor][:name]
    @vendor.description = params[:vendor][:description]
    @vendor.num_of_employees = params[:vendor][:num_of_employees]
    @vendor.market_id = params[:vendor][:market_id]
    @vendor.save

    redirect_to action: 'show', id: @vendor.id
  end

  def edit
    find
  end

  def update
    find

    @vendor.name = params[:vendor][:name]
    @vendor.description = params[:vendor][:description]
    @vendor.num_of_employees = params[:vendor][:num_of_employees]
    @vendor.market_id = params[:vendor][:market_id]

    @vendor.save

    redirect_to action: 'show', id: @vendor.id
  end

  def destroy
    find

    @vendor.destroy
  end

  private
  def find
    @vendor = Vendor.find(params[:id].to_i)
  end
end
