Rails.application.routes.draw do

  namespace :api, defaults: {format: 'json'}  do
    namespace :v1 do
      resources :users
    end
  end
  resources :users
  # /api/v1/users
end
