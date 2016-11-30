Antikb::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users, :controllers => { :sessions => "users/sessions",:registrations => "users/registrations" }, :path_names =>  {:sign_up=>'new',:sign_in => 'login', :sign_out => 'logout'} do    
    get '/users', :to => 'users/registrations#index', :as => :user_root # Rails 3s
    get '/login', :to => 'users/sessions#new'
  end
     
  resources :users     
  resources :articles, :intro, :improve, :sitemap, :faqs, :faq_categories, :proposes, :compliments, :reports, :notices, :models, :galleries

  get 'kbsmind'=>'home#kbsmind'
  
  root :to => 'home#index'
end
