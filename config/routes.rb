Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root 'public_recipes#index'
  resources :users, only: [:index, :show]
  resources :public_recipes, only: [:index]
  resources :recipe_foods, only: [:new, :create, :destroy]
  resources :foods, only: [:index, :new, :create, :destroy]

  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    resources :recipe_foods, only: [:new, :create, :destroy, :update, :edit]
    resources :shopping_lists, only: [:index]
  end

end
