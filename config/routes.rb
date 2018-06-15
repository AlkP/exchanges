Rails.application.routes.draw do
  root 'rates#index'
  resources :rates
end
