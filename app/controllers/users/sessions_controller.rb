class Users::SessionsController < Devise::SessionsController
  layout :layout

  def initialize(*params)
    super(*params)
    @controller_name = t(:login)
  end

  def layout
    if params[:no_layout].present?
      return false
    else
      return 'user'
    end
  end
end
