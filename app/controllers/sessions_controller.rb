class SessionsController < ApplicationController
  
def new
  if current_user != nil
  redirect_to user_path(current_user)
  else
  end
end

debugger
def create
  user = User.authenticate(params[:email], params[:password])
  if user
    if params[:remember_me]
      cookies.permanent[:auth_token] = user.auth_token
    else
      cookies[:auth_token] = user.auth_token
    end
    redirect_back_or(user) 
    flash[:notice] = "Logged in!"
  else
    flash.now.alert = "Invalid email or password"
    render "new"
  end
end

def destroy
  cookies.delete(:auth_token)
  redirect_to root_url, :notice => "Logged out!"
end



end
