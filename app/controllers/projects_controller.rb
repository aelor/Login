class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  
  def index
  #get the client with id = 1
   @client = Client.find(params[:client_id])
  #access all the projects for that particular client
   @projects = @client.projects
  end

  def show
   @client = Client.find(params[:client_id])
  #find a project in client 1 that has id = 2
   @project = @client.projects.find(params[:id])
  end

  def new
   @client = Client.find(params[:client_id])
   #associate an project object with client 1
   @project= @client.projects.build
  end

  def create
   @client = Client.find(params[:client_id])
   @project = @client.projects.build(project_params)
   if @project.save
     redirect_to client_project_url(@client, @project)
   else
     render :action => "new"
   end   
  end
 
  def edit
   @client = Client.find(params[:client_id])
   @project = @client.projects.find(params[:id])
  end

  def update
   @client = Client.find(params[:client_id])
   @project = Project.find(params[:id])
   if @project.update_attributes(project_params)
     redirect_to client_project_url(@client, @project)
   else
    render :action => "edit"
   end
  end
 
  def destroy
   @client = Client.find(params[:client_id])
   @project = Project.find(params[:id])
   @project.destroy

   respond_to do |format|
     format.html { redirect_to client_projects_path(@client)}
     format.xml { head :ok }
   end
  end 
 
  def submit_client
    @client = Client.find_by_client_name(params[:client_name])
    @projects = @client.projects
    
     render :partial=>'/projects/projects_select'
  end
 
  
   private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:project_name, :client_name)
    end
end