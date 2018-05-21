Rails.application.routes.draw do
  root 'users#index'
  # https://railsguides.jp/routing.html#「浅い」ネスト
  resources :users do
    resources :foods, only: [:index, :new]
  end
  resources :foods, only: [:create, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
