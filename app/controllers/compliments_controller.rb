# encoding: utf-8

class ComplimentsController < BoardController
  impressionist :actions=>[:show]
  before_action :authenticate_user!, :except => [:index,:show], :message=>'로그인후 사용가능합니다'
  before_action :set_compliment, only: [:show, :edit, :update, :destroy]  
  
  def initialize(*params)
    super(*params)   
    @controller_name=t('activerecord.models.compliment')
    @style="board"
    @script="board/index"  
  end

  # GET /notices
  # GET /notices.json
  def index
    @compliments = Compliment.order('id desc').page(params[:page]).per(10)
  end

  # GET /notices/1
  # GET /notices/1.json
  def show
  end

  # GET /notices/new
  def new
    @compliment = Compliment.new
    @compliment.build_compliment_content    
  end

  # GET /notices/1/edit
  def edit
  end

  # POST /compliments
  # POST /compliments.json
  def create
    @compliment = Compliment.new(compliment_params)
    @compliment.user_id=current_user.id

    respond_to do |format|
      if @compliment.save
        format.html { redirect_to @compliment, :notice=> @controller_name +t(:message_success_insert)}
        format.json { render json: @compliment, status: :created, location: @compliment }
      else
        format.html { render action: "new" }
        format.json { render json: @compliment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /compliments/1
  # PUT /compliments/1.json
  def update
    respond_to do |format|
      if @compliment.update_attributes(compliment_params)
        format.html { redirect_to @compliment, :notice=> @controller_name +t(:message_success_update)}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @compliment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /compliments/1
  # DELETE /compliments/1.json
  def destroy
    @compliment.destroy
    respond_to do |format|
      format.html { redirect_to compliments_url }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_compliment
      @compliment = Compliment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def compliment_params
      params.require(:compliment).permit(:id, :compliment_category_id, :bank_id, :title, compliment_content_attributes: [:id,:content])
    end
end
