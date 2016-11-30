# encoding: utf-8

class SitemapController < ApplicationController
  def initialize(*params)
    super(*params)   
    @controller_name=t('activerecord.models.sitemap')
    @style="board"
    @script="board/index"  
  end
  
  def index
  end
end
