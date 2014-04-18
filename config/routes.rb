Rails.application.routes.draw do
  root to: 'recipes#index'

  devise_for :users,
    controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :recipes
end
