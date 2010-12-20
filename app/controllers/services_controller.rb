class ServicesController < ApplicationController
  before_filter :require_user, :except => [:index, :show]
  require_role "Manager", :except => [:index, :show]
  respond_to :html
  respond_to :js, :only => :index

  def index
    @services = Service.paginate :page => params[:page], :per_page => Service.page_limit, :order => "created_at DESC"
    respond_with @services
  end

  def show
    @service = Service.find(params[:id])
    respond_with @service
  end

  def new
    @service = Service.new
    respond_with @service
  end

  def create
    @service = Service.create(params[:service])
    respond_with @service
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    @service.update_attributes(params[:service])
    respond_with @service
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    redirect_to :index
  end

end
