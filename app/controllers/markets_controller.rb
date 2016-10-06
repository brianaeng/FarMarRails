class MarketsController < ApplicationController
  # before_filter :set_search

  def index
    @markets = Market.all

    @search_market = Market.search(params[:q])
    @markets = @search_market.result
    @search_market.build_condition
  end

  def show
    find

    @vendor = Vendor.new
  end

  def new
    @market = Market.new
  end

  def create
    @market = Market.new
    #find way to only take params as argument?
    @market.name = params[:market][:name]
    @market.address = params[:market][:address]
    @market.city = params[:market][:city]
    @market.county = params[:market][:county]
    @market.state = params[:market][:state]
    @market.zip = params[:market][:zip]
    @market.save

    redirect_to action: 'show', id: @market.id
  end

  def edit
    find
  end

  def update
    find

    @market.name = params[:market][:name]
    @market.address = params[:market][:address]
    @market.city = params[:market][:city]
    @market.county = params[:market][:county]
    @market.state = params[:market][:state]
    @market.zip = params[:market][:zip]

    @market.save

    redirect_to action: 'show', id: @market.id
  end

  def destroy
    find
    @market.destroy
  end

  private
  def find
    @market = Market.find(params[:id].to_i)
  end
end
