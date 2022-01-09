Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :locations, only: :index
      resources :games, only: :index
      resources :questions, only: :index
    end
  end
end
