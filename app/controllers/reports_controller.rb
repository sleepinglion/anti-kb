class ReportsController < BoardController
  impressionist :actions=>[:show]
  before_action :authenticate_user!, :except => [:index,:show], :message=>'로그인후 사용가능합니다'
  before_action :set_report, only: [:show, :edit, :update, :destroy]

  def initialize(*params)
    super(*params)
    @controller_name=t('activerecord.models.report')
  end

  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.order('id desc').page(params[:page]).per(10)

    respond_to do |format|
      format.html { render layout: layout } # index.html.erb
      format.json { render json: @reports }
    end
  end

  # GET /reports/1
  # GET /reports/1.json
  def show

  end

  # GET /reports/new
  # GET /reports/new.json
  def new
    @report = Report.new
    @report.build_report_content

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @report }
    end
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params)

    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, :notice=> @controller_name +t(:message_success_insert)}
        format.json { render json: @report, status: :created, location: @report }
      else
        format.html { render action: "new" }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reports/1
  # PUT /reports/1.json
  def update
    respond_to do |format|
      if @report.update_attributes(report_params)
        format.html { redirect_to @report, :notice=> @controller_name +t(:message_success_update)}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:id, :report_category_id, :title, report_content_attributes: [:id,:content]).merge(user_id: current_user.id)
    end
end
