class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
   @user = User.find_by(email: params[:session][:email].downcase)
   if signed_in?(@user)
     redirect_to root_url
   elsif 
    @user && @user.authenticate(params[:session][:password])
    sign_in(@user)
    redirect_to new_session_url
   else 
    render :new
   end

  end




end
