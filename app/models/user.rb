class User < ApplicationRecord
  include OmniauthAttributesConcern
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  acts_as_voter
  acts_as_votable
  acts_as_commentable
  validates_presence_of :name, :email, :description, :on => :create
  validates_length_of :name, within: 1..60
  validates_length_of :email, within: 4..150
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_uniqueness_of :email

  validates_length_of :password, :within => 4..200, :allow_blank => true
  mount_uploader :photo, UserUploader
  has_many :user_authorizations

  def self.create_from_omniauth(params)
    self.__send__(params.provider, params)
  end
end
