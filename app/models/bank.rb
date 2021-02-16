class Bank < ActiveRecord::Base
  validates_presence_of :title
  has_many :compliment, :dependent => :destroy
  mount_uploader :photo, BankPhotoUploader
end
