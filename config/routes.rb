Rails.application.routes.draw do
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :users

  root "users#index"

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :show, :create] do
  end

  resources :posts do
    resources :comments, only: [:new, :create]
    end
  end
       #Add comment to a post
    post 'users/:user_id/posts/:id/', to: 'comments#create', as: 'comment_post'

       #Like a post
    post '/users/:user_id/posts/:id/like', to: 'likes#create', as: 'likes'
end
