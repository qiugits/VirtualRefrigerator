Rails.application.routes.draw do
  root 'users#index'
  # https://railsguides.jp/routing.html#「浅い」ネスト
  resources :users do
    resources :foods, only: [:index, :new, :search]
  end
  resources :foods, only: [:create, :edit, :update, :destroy, :search]
  get '/foods/search', to: 'foods#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
