NewsreaderApp::Application.routes.draw do
root :to => 'pages#index'
get '/login' => 'session#new'
post '/login' => 'session#create'
delete '/login' => 'session#destroy'

get '/sources/:id/follow' => 'sources#follow'
get '/feed' => 'users#feed'

resources :articles, :sources, :topics, :users

end
