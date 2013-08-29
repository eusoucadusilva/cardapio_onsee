CardapioOnsee::Application.routes.draw do
  resources :recipes
  get 'my_recipes' => 'recipes#my_recipes'
  devise_for :users
  root to: 'page#index'
end
