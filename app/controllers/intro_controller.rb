# encoding: utf-8

class IntroController < ApplicationController
  def initialize(*params)
    super(*params)   
    @controller_name=t('activerecord.models.intro')
  end
  
  def index
    
  end
end
