class PagesController < ApplicationController
  before_filter :set_search

  def home
  end

  def admin

  end

  def admin_market_login
    if !Market.exists?(id: params[:market][:id].to_i)
      redirect_to '/admin'
    elsif params[:market][:id].to_i == 0
      redirect_to '/admin'
    else
      @id = params[:market][:id].to_i
      redirect_to controller: 'markets', action: 'show', id: @id
    end
  end

  def market
    @id = 10
  end

  def market_login
    if !Market.exists?(id: params[:market][:id].to_i)
      redirect_to '/market'
    elsif params[:market][:id].to_i == 0
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
    if !Vendor.exists?(id: params[:vendor][:id].to_i)
      redirect_to '/vendor'
    elsif params[:vendor][:id].to_i == 0
      redirect_to '/vendor'
    else
      @id = params[:vendor][:id].to_i
      redirect_to controller: 'vendors', action: 'show', id: @id
    end
  end

  def admin_vendor_login
    if !Vendor.exists?(id: params[:vendor][:id].to_i)
      redirect_to '/admin'
    elsif params[:vendor][:id].to_i == 0
      redirect_to '/admin'
    else
      @id = params[:vendor][:id].to_i
      redirect_to controller: 'vendors', action: 'show', id: @id
    end
  end

end
