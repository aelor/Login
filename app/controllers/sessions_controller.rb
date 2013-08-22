class SessionsController < ApplicationController
  
def new
  if current_user != nil
  redirect_to root_url
  flash[:error] = "Why the hell do you want to login if you are already logged in dumb guy !"
  else
  end
end

def create
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
    redirect_back_or(user) 
    flash[:success] = "Logged in!"
  else
    flash.now[:error] = "Invalid email or password"
    render "new"
  end
end

def destroy
  session[:user_id] = nil
  redirect_to root_url, :notice => "Logged out!"
end


end
