class Users::SessionsController < Devise::SessionsController
  layout 'user'

  def initialize(*params)
    super(*params)
    @controller_name=t(:login)
  end
end
