class PagesController < ApplicationController
  before_filter :set_search

  def home
  end

  def admin
  end

  def market
    @id = 10
  end

  def market_login
    if params[:market][:id].to_i == 0
      redirect_to '/market'
    else
      @id = params[:market][:id].to_i
      redirect_to controller: 'markets', action: 'show', id: @id
    end
  end

  def vendor
    @id = 10
  end

  def vendor_login
    if params[:vendor][:id].to_i == 0
      redirect_to '/vendor'
    else
      @id = params[:vendor][:id].to_i
      redirect_to controller: 'vendors', action: 'show', id: @id
    end
  end

end
