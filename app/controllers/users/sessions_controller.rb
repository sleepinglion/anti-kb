class Users::SessionsController < Devise::SessionsController
  layout :layout

  def initialize(*params)
    super(*params)
    @controller_name=t(:login)
    @script='login'
  end

  def create
    user = User.from_omniauth(request.env["omniauth.auth"]) ## Setting "user" here
    session[:user_id] = user.id  ## Changed this to use the set "user"
    redirect_to root_url
  end

  def layout
    if params[:no_layout].present?
      return false
    else
      return 'user'
    end
  end
end
