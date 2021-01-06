class ApplicationController < ActionController::Base
  layout :layout
  before_action :set_locale

  def initialize(*params)
    super(*params)

    @application_name=t(:application_name)
    @controller_name=t(:application_name)
    @title=t(:default_title)

    @meta_robot='all, index, follow'
    @meta_description=t(:meta_description)
    @meta_keywords=t(:meta_keywords)
    @meta_image=t(:meta_image)
    @meta_url=t(:meta_url)

    @page_itemtype="http://schema.org/WebPage"
    @resource ||= User.new
  end

  def current_ability
    @current_ability ||= UserAbility.new(current_user)
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to new_user_session_path, :notice => t(:unauthenticated,scope:[:devise,:failure])
  end

  def set_locale
    I18n.locale = params[:locale] || session[:locale] || I18n.default_locale
    session[:locale] = I18n.locale

    @language={t(:korean)=>'ko',t(:english)=>'en',t(:chineses)=>'zh-CN'}
  end

  def layout
    if params[:no_layout]
      return false
    else
      return 'application'
    end
  end
end
