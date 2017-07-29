class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  include OmniConcern
  %w[facebook twitter gplus].each do |meth|
    define_method(meth) do
      create
    end
  end
end
