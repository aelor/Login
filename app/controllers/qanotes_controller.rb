class QanotesController < ApplicationController
  before_action :set_qanote, only: [:show, :edit, :update, :destroy]
  before_action :signed_in 
  helper_method :sort_column, :sort_direction

  # GET /qanotes
  # GET /qanotes.json
  
  
  def index
   
    @qanotes = current_user.qanotes.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => params[:page])
   # @qanotes = Qanote.all.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => params[:page])
  end

  # GET /qanotes/1
  # GET /qanotes/1.json
  def show
    # For URL like /orders/1/items/2
    # Find an item in orders 1 that has id=2
    @qanote = Qanote.find(params[:id])
  end

  # GET /qanotes/new
  def new
    @qanote = Qanote.new
  end
  # GET /qanotes/1/edit
  def edit
    authorize! :update, @qanote, :message => "Not authorized to edit this qanote."
  end
  # POST /qanotes
  # POST /qanotes.json

  def create
    @qanote = current_user.qanotes.build(qanote_parameters)
    
    respond_to do |format|
      if @qanote.save
        QanoteMailer.newtag(current_user).deliver
        format.html { redirect_to @qanote, notice: 'Qanote was successfully created.' }
        format.json { render action: 'show', status: :created, location: @qanote }
      else
        format.html { render action: 'new' }
        format.json { render json: @qanote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /qanotes/1
  # PATCH/PUT /qanotes/1.json
  def update
    respond_to do |format|
      if @qanote.update(qanote_parameters)
        format.html { redirect_to @qanote, notice: 'Qanote was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: 'edit' }
        format.json { render json: @qanote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qanotes/1
  # DELETE /qanotes/1.json
  def destroy
    authorize! :destroy, @qanote, :message => "Not authorized to delete this qanote."
    @qanote.destroy
    respond_to do |format|
      format.html { redirect_to qanotes_url, notice: 'Qanote was successfully deleted.' }
      format.json { head :no_content }
    end
  end
  
  def submit_server
     @qanote = Qanote.where(servername: params[:servername],projectname: params[:projectname]).load.last
     render :partial=>'/qanotes/tag_select'
  end
  
  private
  
  def sort_column
    Qanote.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end
   
    # Use callbacks to share common setup or constraints between actions.
    def set_qanote
      @qanote = Qanote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def qanote_parameters
      params.require(:qanote).permit(:clientdetail, :productname, :projectname, :currenttag, :oldtag, :servername, :date, :developername, :gatekeeper, :uploadedfromtag, :tasknodetail, :patchnamedetail, :diff1, :diff2, :signature, :testedby, :user_id, :task_id)
    end
end
