Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :locations, only: :index

      resources :questions, only: :index

      resources :scores, only: %i[show index]

    end
  end
end
