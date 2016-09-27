Rails.application.routes.draw do

  get 'signup' => 'users#new'

  root 'blog#home'

  get 'help' => 'blog#help'

  get 'about' => 'blog#about'

  get 'login' => 'sessions#new'

  post 'login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :microposts, only: [:create, :destroy, :show]
  resources :relationships,       only: [:create, :destroy]
  resources :comments, only: [:create, :edit, :update, :destroy]
end
