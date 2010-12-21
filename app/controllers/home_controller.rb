class HomeController < ApplicationController

  before_filter :require_no_user, :only => [:show_order_info]

  respond_to :html

  def index

  end

  def show_order_info
    redirect_to root_path and return unless request.post? or params[:order]
    @order = Order.find_by_code(params[:order][:code])
    if @order
      render :template => "/home/show_order" and return
    else
      flash[:notice] = t "orders.not_found"
      render :index
    end
  end

end