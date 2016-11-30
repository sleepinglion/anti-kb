# encoding: utf-8

class ReportCategory < ActiveRecord::Base
  validates_presence_of :title
  has_many :report,:dependent => :destroy
end
