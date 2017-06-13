class User < ActiveRecord::Base
  validates_presence_of :name, :email, :password, :description, :on => :create
  validates_length_of :email, :within => 4..255
  validates :email, :email => {:strict_mode => true}
  validates_length_of :password, :within => 4..255
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :photo, UserUploader
end
