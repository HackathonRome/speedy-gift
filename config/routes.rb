Giftz::Application.routes.draw do
  root 'welcome#index'

  get 'registration' => 'user#register', as: :registration
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  get 'friends' => 'welcome#friends', as: :friends
  get 'friend/:id' => 'welcome#friend', as: :friend

  resources :gifts, only: [:index], path: 'gifts/:friend_id' do
    get :random, on: :collection
  end
end
