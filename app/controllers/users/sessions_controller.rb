class Users::SessionsController < Devise::SessionsController
  layout 'special'

  def initialize(*params)
    super(*params)
    @controller_name=t(:login)
  end
end
