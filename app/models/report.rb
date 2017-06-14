class Report < ActiveRecord::Base
  is_impressionable
  validates_presence_of :title
  belongs_to :user, counter_cache: true
  belongs_to :report_category, counter_cache: true
  has_one :report_content, :foreign_key => :id, :dependent => :destroy
  accepts_nested_attributes_for :report_content, :allow_destroy => true
end
