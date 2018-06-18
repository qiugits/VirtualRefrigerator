Rails.application.routes.draw do
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  # https://railsguides.jp/routing.html#「浅い」ネスト
  resources :users do
    resources :foods, only: [:index, :new, :search]
  end
  resources :foods, only: [:create, :edit, :update, :destroy, :search]
  get '/foods/search', to: 'foods#search'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
