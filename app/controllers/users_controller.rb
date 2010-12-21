class UsersController < ApplicationController

  before_filter :require_user
  require_role "Admin"
  respond_to :html

  def show
    @user = User.find(params[:id])
    respond_with @user
  end

  def new
    @user = User.new
    respond_with @user
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to admin_path and return
    end
    respond_with @user
  end

  def edit
    @user = User.find(params[:id])
    respond_with @user
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      Rails.logger.debug("OKOKOKOKOKOKOKOKOK")
      redirect_to admin_path and return
    end
    Rails.logger.debug("FFFFUUUUUUU")
    respond_with @user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_path
  end

end