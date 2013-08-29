CardapioOnsee::Application.routes.draw do
  resources :recipes
  devise_for :users
  root to: 'page#index'
end
