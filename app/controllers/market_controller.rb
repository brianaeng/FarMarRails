class MarketController < ApplicationController
  def index
    @all_markets = Market.all
  end

  def show
    find
  end

  def new
    @market = Market.new
  end

  def create
    @market = Market.new
    #do name, address, etc. need to be strings?
    @market.name = params[:market][:name]
    @market.address = params[:market][:address]
    @market.city = params[:market][:city]
    @market.county = params[:market][:county]
    @market.state = params[:market][:state]
    @market.zip = params[:market][:zip]
    @market.save

    # redirect_to root_path
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
  end

  def destroy
    find
    @market.destroy
  end

private
  def find
    @market = Market.find(params[:id].to_i)
    #self.class.find(params[:id].to_i)
  end
end
