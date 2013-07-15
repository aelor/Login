class UsersController < ApplicationController
  before_filter :check_login, :only => [:index]
  
  def index
  end

  def show
  end

  def new
    @user = User.new
  end
  
  def create
    
    @user = User.new
    @user.first_name = params[:user][:first_name]
    @user.last_name = params[:user][:last_name]
    @user.password = params[:user][:password]
    @user.email = params[:user][:email]
    @user.password_confirmation = params[:user][:password_confirmation]
    #@user = User.new(params[:user])
    
    if @user.save
      flash[:status] = TRUE
      flash[:alert] = "Congratulations ! you have successfully registered."
    else
      flash[:status] = FALSE
      flash[:alert] = @user.errors.full_messages
    end
    
    redirect_to register_path
  end
end