# encoding: utf-8

class ProposesController < ApplicationController
  before_action :authenticate_user!, :except => [:index,:show], :message=>'로그인후 사용가능합니다'
  before_action :set_propose, only: [:show, :edit, :update, :destroy]    
    
  def initialize(*params)
    super(*params)   
    @controller_name=t('activerecord.models.propose')
    @style="board"
    @script="board/index"  
  end
  
  # GET /proposes
  # GET /proposes.json
  def index
    @proposes = Propose.order('id desc').page(params[:page]).per(5)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @proposes }
    end
  end

  # GET /proposes/1
  # GET /proposes/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @propose }
    end
  end

  # GET /proposes/new
  # GET /proposes/new.json
  def new
    @propose = Propose.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @propose }
    end
  end

  # GET /proposes/1/edit
  def edit
  end

  # POST /proposes
  # POST /proposes.json
  def create
    @propose=Propose.new(propose_params)
    @propose.user_id=current_user.id    

    respond_to do |format|
      if @propose.save
        format.html { redirect_to :action=>'index', :notice=> @controller_name +t(:message_success_insert)}
        format.json { render json: @propose, status: :created, location: @propose }
      else
        format.html { render action: "new" }
        format.json { render json: @propose.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /proposes/1
  # PUT /proposes/1.json
  def update
    respond_to do |format|
      if @propose.update_attributes(propose_params)
        format.html { redirect_to :action=>'index', :notice=> @controller_name +t(:message_success_update)}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @propose.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proposes/1
  # DELETE /proposes/1.json
  def destroy
    @propose.destroy
    respond_to do |format|
      format.html { redirect_to proposes_url }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_compliment
      @propose = Propose.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def propose_params
      params.require(:propose).permit(:id,:title,:content)
    end  
end
