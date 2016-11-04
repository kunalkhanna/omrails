Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  resources :tweets
  devise_for :users
  root 'pages#home'
  get 'about' => 'pages#about'
  get 'contact_us' => 'pages#contact_us'
  as :user do
  	get "signin" => 'devise/sessions#new'
  	get "signup" => 'devise/registrations#new'
  	delete "signout" => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
