Rails.application.routes.draw do
  
  get 'home/index'
  get '/vote_add' => 'home#vote_add'
  post '/finish' => 'home#finish'
  get '/admin' => 'destinations#index'
  get '/participants' => 'destinations#participants'
  devise_for :users
  
  resources :destinations

  root :to => "home#index"
end
