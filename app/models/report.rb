class Report < ActiveRecord::Base
  is_impressionable
  validates_presence_of :title
  belongs_to :user, :autosave=>true
  belongs_to :report_category, :autosave=>true
  has_one :report_content, :foreign_key => :id, :dependent => :destroy
  accepts_nested_attributes_for :report_content, :allow_destroy => true
end
