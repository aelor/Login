class TasksController < ApplicationController
  before_action :signed_in
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
  #get the client with id = 1

   @client = Client.find(params[:client_id])
   @project = Project.find(params[:project_id])
  #access all the projects for that particular client
   @task = @project.tasks
  end

  def show
 
  # @client = Client.find(params[:client_id])
  # @project = Project.find(params[:project_id])
  #find a project in client 1 that has id = 2
   @task = Task.find(params[:id])
  end

  def new
    
   @client = Client.find(params[:client_id])
   @project = Project.find(params[:project_id])
   #associate an project object with client 1
   @task = @project.tasks.build
  end

  def create

   @client = Client.find(params[:client_id])
   @project = Project.find(params[:project_id])
   @task = @project.tasks.build(task_params)
   @task.task_assigned_to = User.find(params[:task][:user_id]).email
   if @task.save
     TaskMailer.newtask(@task).deliver
     redirect_to client_project_task_url(@client, @project, @task)
   else
     render :action => "new"
   end   
  end
 
  def edit

   @client = Client.find(params[:client_id])
   @project = Project.find(params[:project_id])
   @task = @project.tasks.find(params[:id])
  end

  def update

   @client = Client.find(params[:client_id])
   @project = Project.find(params[:project_id])
   @task = Task.find(params[:id])
   if @task.update_attributes(task_params)
     redirect_to client_project_task_url(@client, @project, @task)
   else
    render :action => "edit"
   end
  end
 
  def destroy
    
   @client = Client.find(params[:client_id])
   @project = Project.find(params[:project_id])
   @task = Task.find(params[:id])
   @task.destroy

   respond_to do |format|
     format.html { redirect_to client_project_users_path(@client,@project)}
     format.xml { head :ok }
   end
  end 
  
   private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:task_name, :client_id, :project_id, :user_id, :client_name, :project_name, :task_description)
    end

end
