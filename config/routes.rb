NewsreaderApp::Application.routes.draw do
root :to => 'pages#index'
get '/login' => 'session#new'
post '/login' => 'session#create'
delete '/login' => 'session#destroy'

get '/sources/:id/follow' => 'sources#follow'
get '/sources/:id/unfollow' => 'sources#unfollow'
get '/feed' => 'users#feed'
get '/search' => 'pages#search'

resources :articles, :sources, :topics, :users

end
