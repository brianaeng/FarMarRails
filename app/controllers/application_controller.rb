class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # def set_search
  #   @q = Market.ransack(params[:q])
  # end

  def set_search
    @search = Market.search(params[:q])
  end
end
