class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
   @user = User.find_by(email: params[:session][:email].downcase)
  
   if @user && @user.authenticate(params[:session][:password])
    sign_in(@user)
    flash[:success] = "Signed In Successfully"
    redirect_to posts_index_path
   else 
    render :new
   end

  end

  def destroy
    sign_out if signed_in?
    flash[:success] = "Signed Out Successfully"
    redirect_to root_url
  end




end
