class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
   @user = User.find_by(email: params[:session][:email].downcase)
  
   if @user && @user.authenticate(params[:session][:password])
    sign_in(@user)
    redirect_to posts_index_path
   else 
    render :new
   end

  end




end
