class AdminController < ApplicationController
  before_filter :require_user
  require_role "Admin"

  respond_to :html

  def index
    @users = User.scoped
    respond_with @users
  end

  def edit
    @user = User.find(params[:id])
    respond_with @user
  end

end
