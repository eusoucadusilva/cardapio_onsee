CardapioOnsee::Application.routes.draw do
  devise_for :users

  root to: 'page#index'
end
