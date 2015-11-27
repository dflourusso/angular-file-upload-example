Rails.application.routes.draw do
  root 'welcome#index'

  resources :docs
  resources :welcome, :angular_docs, only: :index
  namespace :api, format: :json do
    resources :docs
  end
end