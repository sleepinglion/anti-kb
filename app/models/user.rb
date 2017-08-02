class User < ActiveRecord::Base
  include OmniauthAttributesConcern
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  acts_as_voter
  acts_as_votable
  acts_as_commentable
  validates_presence_of :name, :email, :description, :on => :create
  validates_length_of :email, :within => 4..255
  validates :email, :email => {:strict_mode => true}
  validates_length_of :password, :within => 4..255,:allow_blank => true
  mount_uploader :photo, UserUploader
  has_many :user_authorization

  def self.create_from_omniauth(params)
        self.send(params.provider,params)
    end

end
