Rails.application.routes.draw do
  root to: 'home#index'
  get '/auth/github', as: :github
  get "/auth/:provider/callback",  to: 'sessions#create'
end
