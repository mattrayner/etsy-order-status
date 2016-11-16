Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/authorize', to: 'welcome#authorize', as: 'authorize_url'
  get '/show', to: 'welcome#show'
end
