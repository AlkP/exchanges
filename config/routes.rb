Rails.application.routes.draw do
  root 'rates#index'

  get '/rates/:id', to: 'rates#show', as: 'rate'
  get '/rates_by_date/:date', to: 'rates#archive', as: 'rate_by_date'
  # resources :rates
end
