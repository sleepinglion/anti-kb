# encoding: utf-8

class ModelsController < BoardController
  before_action :authenticate_user!, :except => [:index,:show]
  before_action :set_model, only: [:show, :edit, :update, :destroy]    

  def initialize(*params)
    super(*params)   
    @controller_name=t('activerecord.models.model')
    @style="board"
    @script="board/index"  
  end
  
  # GET /notices
  # GET /notices.json
  def index
    @models = Model.order('id desc').page(params[:page]).per(5)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @models }
    end
  end

  # GET /notices/1
  # GET /notices/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @model }
    end
  end

  # GET /notices/new
  # GET /notices/new.json
  def new
    @model = Model.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @model }
    end
  end

  # GET /notices/1/edit
  def edit
  end

  # POST /notices
  # POST /notices.json
  def create
    @model = Model.new(model_params)
    @model.user_id=current_user.id

    respond_to do |format|
      if @model.save
        format.html { redirect_to @model, :notice=> @controller_name +t(:message_success_insert)}
        format.json { render json: @model, status: :created, location: @model }
      else
        format.html { render action: "new" }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /notices/1
  # PUT /notices/1.json
  def update
    respond_to do |format|
      if @model.update_attributes(model_params)
        format.html { redirect_to @model, :notice=> @controller_name +t(:message_success_update)}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notices/1
  # DELETE /notices/1.json
  def destroy
    @model.destroy
    respond_to do |format|
      format.html { redirect_to notices_url }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_model
      @model = Model.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def model_params
      params.require(:model).permit(:id, :title, :recommend_description, :models_comment , :photo, :photo_cache)
    end  
end
