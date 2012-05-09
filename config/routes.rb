YentaFriend::Application.routes.draw do
  


  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_for :admins
  mount RailsAdmin::Engine => '/manage', :as => 'rails_admin'

  get "paypal_express/checkout"
	post "paypal_express/handle_response"
	get "paypal_express/authenticate_redirect"

  match '/fb_handler/request_callback/:profile_type' => 'fb_handler#request_callback', :as => 'fb_callback'

  resources :profiles do
    member do
      post 'invite'
    end
  end
  
  scope :controller => :dashboard do
    match "login"
    match "dashboard"
    match "welcome"
    match "contacts"
    match "browse"
    match "inbox"
    match "matchbook"
    match "initialize_profile"
    match "send_invite"
    match "add_catch"
    match "suggest_match"
    match "approve_match"
    match "reject_match"
    match "message"
    match "endorsements"
    match "account"
  end
  
  scope :controller => :conversations do
    match "send_message"
    match "conversation/:id" => :show, :as => "conversation"
  end
  
  resources :connections
  match 'create_match' => 'profiles#create_match'
  
  match "project" => 'static_pages#project'
  match "team" => 'static_pages#team'
  match "login" => 'static_pages#login'
  
  match 'dashboard' => 'yenta_friend#dashboard'
  match 'browse' => 'yenta_friend#browse'
  # match 'connections' => 'yenta_friend#connections'
  match 'chickstud_connections(/:id)' => 'yenta_friend#chickstud_connections', :as => :chickstud_connections
  match 'inbox' => 'yenta_friend#inbox'
  match 'stable' => 'yenta_friend#stable'
  
  
  
  
  root :to => 'dashboard#login'
    
end
