Rails.application.routes.draw do
    
#  devise_for :users
  
  devise_for :users, :controllers => { registrations: 'registrations' }
  
  root 'front#index'
  
  get '/dashboard' => 'dashboard#index'
  get '/email/new' => 'email#new'
  post '/email/create' => "email#create", :as => :create_email
  
  resources :email_templates
  

end
