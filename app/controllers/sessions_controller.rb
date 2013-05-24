class SessionsController < ApplicationController
  def new
  end
  #Create new  Session, authenticate user and Save remember token to database to keep track user status
  def create
   user = User.find_by_email(params[:session][:email].downcase)
   if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to products_path
   else
      flash.now[:error] = 'Invalid email/password combination' 
      render 'new'
   end
 end

  #Destroy session
  def destroy
    sign_out
    redirect_to root_url
  end
end
