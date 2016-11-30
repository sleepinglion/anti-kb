# encoding: utf-8

class ReportContent < ActiveRecord::Base
  validates_presence_of :content
  belongs_to :report, :foreign_key => :id, :autosave=>true
  accepts_nested_attributes_for :report, :allow_destroy => true
end
