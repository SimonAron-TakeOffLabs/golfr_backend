Rails.application.routes.draw do
  devise_for :users, skip: :all

  namespace :api do
    post 'login', to: 'users#login'
    get 'feed', to: 'scores#user_feed'
    resources :scores, only: %i[create destroy] do
      member do
        get 'all'
      end
    end
  end
end
