class UsersController < ApplicationController

before_action :signed_in

def new
  @user = User.new
  authorize! :create, @user, :message => "Not authorized to create a new user."
end

def index
  @users = User.all.search(params[:search]).paginate(:per_page => 10, :page => params[:page])
end

def show
  @user = User.find(params[:id])
  if @user != current_user 
    authorize! :new, :message => "Not authorized to see other users profile."
  end
end
  
def edit
  @user = User.find(params[:id])
  if @user != current_user
   authorize! :edit, @user, :message => "Not authorized to edit a user."
  end
end

def create
  authorize! :create, @user, :message => "Not authorized to create a new user."

  #params[:user_id].destroy :role
  
  @user = User.new(params[:user])
   roles = Role.find(params[:user][:role_ids]) rescue []
    @user.roles = roles
  if @user.save
    UserMailer.registration_confirmation(@user).deliver
    redirect_to users_path
    flash[:success] = "User successfully created as #{Role.find_by_id(roles).name}!"
  else
    render "new"
  end

end

def update
  
  #params[:user_id].destroy :role
    @user = User.find(params[:id])
    roles = Role.find(params[:user][:role_ids]) rescue []
    @user.roles = roles
  if @user != current_user
   authorize! :update, @user, :message => "Not authorized to edit user."
  else
    if @user.update_attributes(params[:user])
      flash[:success] = "Account updated"
      redirect_to root_url
    else
      render 'edit'
    end
  end
end

def destroy
  @user = User.find(params[:id])
  @user.destroy
  
  redirect_to users_path
  flash[:success] = "User successfully deleted !"
end

def add_admin_role
  @user = User.find(params[:id])
  @user.add_role "admin"
  
  redirect_to edit_user_path
  flash[:success] = "Successfully promoted to admin"
end

def remove_admin_role
  @user = User.find(params[:id])
  @user.remove_role "admin"
  @user.add_role "normaluser"
  redirect_to edit_user_path, :notice => "Removed permissions as admin"
end

def add_rm_role
  @user = User.find(params[:id])
  @user.add_role "rm"
  
  redirect_to edit_user_path
  flash[:success] = "Successfully changed permissions to Reporting manager !"
end

def remove_rm_role
  @user = User.find(params[:id])
  @user.remove_role "rm"
  @user.add_role "normaluser"
  redirect_to edit_user_path, :notice => "Removed permissions as reporting manager"
end

def add_quality_role
  @user = User.find(params[:id])
  @user.add_role "quality"
  
  redirect_to edit_user_path 
  flash[:success] = "Successfully changed permissions to quality manager !"
end

def remove_quality_role
  @user = User.find(params[:id])
  @user.remove_role "quality"
  @user.add_role "normaluser"
  redirect_to edit_user_path, :notice => "Removed permissions as quality manager"
end

end
