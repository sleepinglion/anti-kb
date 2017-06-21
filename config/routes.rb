Antikb::Application.routes.draw do
  root 'home#index'
  mount Ckeditor::Engine => 'ckeditor'

  devise_for :admins, :controllers => { :sessions => "admins/sessions",:registrations => "admins/registrations" }, :path_names =>  {:sign_up=>'new',:sign_in => 'login', :sign_out => 'logout'} do
    get 'edit', :to => 'admins::Registrations#edit'
    get 'login', :to => 'admins::Sessions#new'
    get 'logout', :to=> 'admins::Sessions#destroy'
  end

  devise_for :users, :controllers => { :sessions => "users/sessions",:registrations => "users/registrations",:passwords => "users/passwords"}, :path_names =>  {:sign_up=>'new',:sign_in => 'login', :sign_out => 'logout'} do
    get '/users', :to => 'users/registrations#index', :as => :user_root # Rails 3s
    get '/login', :to => 'users/sessions#new'
  end

  resources :users do
    member do
      put 'like', to: 'users#upvote'
      put 'dislike', to: 'users#downvote'
    end
  end

  resources :reports do
    member do
      put 'like', to: 'reports#upvote'
      put 'dislike', to: 'reports#downvote'
    end
  end

  resources :compliments  do
    member do
      put 'like', to: 'compliments#upvote'
      put 'dislike', to: 'compliments#downvote'
    end
  end

  resources :models  do
    member do
      put 'like', to: 'models#upvote'
      put 'dislike', to: 'models#downvote'
    end
  end

  resources :articles, :intro, :improve, :sitemap, :faqs, :faq_categories, :proposes, :notices, :galleries
  get 'kbsmind'=>'home#kbsmind'
  get 'feed',:to=>'home#feed'

  scope 'admin', module: 'admin', as: 'admin' do
    get '/' => 'admin_home#index'
    resources :users, :articles, :improve, :faq_categories, :faqs , :proposes, :compliment_categories, :compliments, :report_categories, :reports, :notices, :models, :banks
  end
end
