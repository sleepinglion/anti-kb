class Users::PasswordsController < Devise::PasswordsController
  layout 'user'
    
    protected

    def after_sending_reset_password_instructions_path_for(_resource_name)
        root_path
    end
end
