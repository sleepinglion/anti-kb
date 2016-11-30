# encoding: utf-8

class BoardController < ApplicationController
  layout :layout
 
  def initialize(*params)
    super(*params)
    @style="board"
    @script="board"
    @board_name='게시판'
  end
  
  def layout
    if(params[:no_layout])
      return nil
    else
      return 'application'
    end
  end
end