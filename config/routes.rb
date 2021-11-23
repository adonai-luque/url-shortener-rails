Rails.application.routes.draw do
  root to: 'urls#index'
  get '/:short', to: 'urls#show'
  post '/urls', to: 'urls#create'
end
