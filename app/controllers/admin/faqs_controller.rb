class Admin::FaqsController < Admin::AdminController
  before_action :set_admin_faq, only: [:show, :edit, :update, :destroy]

  def initialize(*params)
    super(*params)

    @category = t(:menu_board,scope:[:admin_menu])
    @controller_name = t('activerecord.models.faq')
  end

  # GET /admin/faqs
  # GET /admin/faqs.json
  def index
    @admin_faq_categories = FaqCategory.all

    if(params[:faq_category_id])
      @categoryId=params[:faq_category_id].to_i
    else
      if @admin_faq_categories[0]
        @categoryId=@admin_faq_categories[0].id.to_i
      else
        @categoryId=nil
      end
    end

    @admin_faqs = Faq.where(:faq_category_id=>@categoryId).order('id desc').page(params[:page]).per(10)

    if(params[:id])
      @admin_faq = Faq.find(params[:id])
    end

    admin=false
    if(current_user)
      if(current_user.admin)
        admin=true
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: {:faqs=>@admin_faqs,:admin=>admin} }
    end
  end

  # GET /admin/faqs/1
  # GET /admin/faqs/1.json
  def show
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_faqContent }
    end
  end

  # GET /admin/faqs/new
  # GET /admin/faqs/new.json
  def new
    @admin_faq = Faq.new
    @admin_faq.build_faq_content
    @admin_faq_categories = FaqCategory.all
    @admin_faq_category_id=params[:faq_category_id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_faq }
    end
  end

  # GET /admin/faqs/1/edit
  def edit
    @admin_faq_categories = FaqCategory.all
    @admin_faq_category_id=@admin_faq.faq_category.id
  end

  # POST /admin/faqs
  # POST /admin/faqs.json
  def create
    @admin_faq = Faq.new(admin_faq_params)

    respond_to do |format|
      if @admin_faq.save
        format.html { redirect_to faqs_url(:faq_category_id=>@admin_faq.faq_category.id), notice: 'Faq was successfully created.' }
        format.json { render json: @admin_faq, status: :created, location: @admin_faq }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_faq.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/faqs/1
  # PUT /admin/faqs/1.json
  def update
    respond_to do |format|
      if @admin_faq.update_attributes(admin_faq_params)
        format.html { redirect_to faqs_url(:faq_category_id=>@admin_faq.faq_category.id), notice: 'Faq was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_faq.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/faqs/1
  # DELETE /admin/faqs/1.json
  def destroy
    @admin_faq.destroy

    respond_to do |format|
      format.html { redirect_to admin_faqs_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_admin_faq
    @admin_faq = Faq.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_faq_params
    params.require(:faq).permit(:title, :enable)
  end
end
