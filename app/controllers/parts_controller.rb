class PartsController < ApplicationController
  before_filter :require_user, :except => [:index, :show]
  require_role "Manager", :except => [:index, :show]
  respond_to :html
  respond_to :js, :only => :index

  def index
    @parts = Part.paginate :page => params[:page], :per_page => Part.page_limit, :order => "created_at DESC"
    respond_with @parts
  end

  def show
    @part = Part.find(params[:id])
    respond_with @part
  end

  def new
    @part = Part.new
    respond_with @part
  end

  def create
    @part = Part.create(params[:part])
    respond_with(@part)
  end

  def edit
    @part = Part.find(params[:id])
  end

  def update
    @parts = Part.find(params[:id])
    respond_with @parts
  end

  def destroy
    @part = Part.find(params[:id])
    @part.destroy
    redirect_to parts_path
  end

end
