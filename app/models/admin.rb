class Admin < ActiveRecord::Base
  self.table_name = 'users'
  devise :database_authenticatable, :registerable, :trackable, :validatable, :timeoutable
  validates_length_of :login_id, within: 4..40
  mount_uploader :photo, UserUploader
  default_scope { where(:admin => true) }

  def timeout_in
    1.day
  end

  def email_required?
    false
  end
end
