class PagesController < ApplicationController
  def home
    @markets = Market.all
  end

  def admin
  end

  def market
  end

  def vendor
  end

end
