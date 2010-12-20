class PasswordResetsController < ApplicationController

  before_filter :require_no_user
  before_filter :load_user_using_perishable_token, :only => [ :edit, :update ]

  def new
    render
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user
      @user.deliver_password_reset_instructions!
      flash[:notice] = t("reset_password.reset_instructions_sent")
      redirect_to root_path
    else
      flash.now[:error] = t("reset_password.account_not_found")
      render :action => :new
    end
  end

  def edit
  end

  def update
    @user.password = @user.password_confirmation = params[:password]
    if @user.save
      flash[:success] = t("reset_password.password_updated")
      redirect_to root_path
    else
      render :action => :edit
    end
  end


  private

  def load_user_using_perishable_token
    @user = User.find_using_perishable_token(params[:id])
    unless @user
      flash[:error] = t("reset_password.account_not_found")
      redirect_to root_url
    end
  end

end
