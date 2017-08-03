module OmniauthAttributesConcern
     extend ActiveSupport::Concern
     module ClassMethods
       def twitter params
           (params['info']['email'] = "dummy#{SecureRandom.hex(10)}@dummy.com") if params['info']['email'].blank?
           attributes = {
                           email: params['info']['email'],
                           name: params['info']['nickname'],
                           encrypted_password: Devise.friendly_token,
                           description: '망해라'
                       }
           create(attributes)
       end
     end
 end
