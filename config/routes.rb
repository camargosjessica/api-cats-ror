Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :cats
  end
end
