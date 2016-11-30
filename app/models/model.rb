# encoding: utf-8

require 'carrierwave/orm/activerecord'

class Model < ActiveRecord::Base
  validates_presence_of :title, :recommend_description, :models_comment
  belongs_to :user, :autosave=>true
  has_many :model_comment, :dependent => :destroy
  accepts_nested_attributes_for :model_comment, :allow_destroy => true
  mount_uploader :photo, ModelPhotoUploader
end
