class Compliment < ActiveRecord::Base
  is_impressionable
  validates_presence_of :title
  belongs_to :user, :autosave=>true
  belongs_to :bank, :autosave=>true
  belongs_to :compliment_category, :autosave=>true
  has_one :compliment_content, :foreign_key => :id, :dependent => :destroy
  accepts_nested_attributes_for :compliment_content, :allow_destroy => true
end
