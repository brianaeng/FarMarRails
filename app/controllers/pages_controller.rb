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
  end

end
