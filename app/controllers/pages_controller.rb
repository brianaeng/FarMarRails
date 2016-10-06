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
    @id = params[:market][:id].to_i
    redirect_to controller: 'markets', action: 'show', id: @id
  end

  def vendor
    @id = 10
  end

  def vendor_login
    @id = params[:vendor][:id].to_i
    redirect_to controller: 'vendors', action: 'show', id: @id
  end

end
