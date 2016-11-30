# encoding: utf-8

class CommentController < ApplicationController
 
  def initialize(*params)
    super(*params)
    @style="board/index"
    @script="board/index"
    @board_name='게시판'
  end
end