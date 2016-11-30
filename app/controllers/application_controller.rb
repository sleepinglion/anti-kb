# encoding: utf-8

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  
  def initialize(*params)
    super(*params)
    
    
    @title=t(:application_name)
    
    @application_name=t(:application_name)
    @controller_name=t(:application_name)
    
    @meta_robot='all, index, follow'
    @meta_description=t(:meta_description)
    @meta_keyword=t(:meta_keyword)
           
    @style='application'
    @script='application'
  end
  
  def set_locale
     I18n.locale = params[:locale] || I18n.default_locale
  end
  
  def layout
    if(params[:no_layout])
      return nil
    else
      return 'application'
    end
  end
end
