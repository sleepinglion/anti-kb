class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  acts_as_voter
  acts_as_votable  
  validates_presence_of :name, :email, :description, :on => :create
  validates_length_of :email, :within => 4..255
  validates :email, :email => {:strict_mode => true}
  validates_length_of :password, :within => 4..255,:allow_blank => true
  mount_uploader :photo, UserUploader
end
