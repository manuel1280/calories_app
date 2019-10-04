Rails.application.routes.draw do
  #get 'home/index'
  resources :calories
  resources :share_tokens, only: :create
  devise_for :users, controllers: {registrations: 'registrations'}
  get 'send_progress', to: 'send_progress#index' 
  post '/send_email', to: 'send_progress#send_email', as: :send_progress_email
  get "calories?token=#{@token}", to: 'share_graphs#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
end
