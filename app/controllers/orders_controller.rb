class OrdersController < ApplicationController

  before_filter :require_user
  require_role "Manager"

  respond_to :html
  respond_to :js, :only => :index

  def index
    @orders = Order.paginate :page => params[:page], :per_page => Order.page_limit, :order => "created_at DESC"
    respond_with @orders
  end

  def show
    @order = Order.find(params[:id])
    respond_with @order
  end

  def new
    @order = Order.new(:manager => current_user)
    @client = Client.new
    respond_with @order
  end

  def edit
    @order = Order.find(params[:id])
  end

  def create
    params[:order].delete :client_attributes unless params[:order][:client_id].blank?
    @order = Order.new(params[:order])
    if @order.save
      respond_with @order
    else
      @client = Client.new unless params[:order][:client_id].blank?
      render "new"
    end
  end

  def update
    @order = Order.find(params[:id])
    @order.update_attributes(params[:order])
    respond_with @order
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path
  end
end
