Rails.application.routes.draw do
  
  get '/force_users' => 'force_users#index'
  get '/force_users/new' => 'force_users#new'
  post '/force_users' => 'force_users#create'
  get '/force_users/:id' => 'force_users#show'
  get '/force_users/:id/edit' => 'force_users#edit'
  patch '/force_users/:id' => 'force_users#update'
  delete '/force_users/:id' => 'force_users#destroy'

end
