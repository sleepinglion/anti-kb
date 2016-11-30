# encoding: utf-8

class ComplimentContent < ActiveRecord::Base
  validates_presence_of :content
  belongs_to :compliment, :foreign_key => :id, :autosave=>true  
  accepts_nested_attributes_for :compliment, :allow_destroy => true
end
