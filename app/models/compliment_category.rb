class ComplimentCategory < ActiveRecord::Base
  validates_presence_of :title
  has_many :compliment,:dependent => :destroy
end
