AbakPress::Application.routes.draw do

  root :to => "wiki_posts#index"
  get '/*ids/edit', :to => "wiki_posts#edit"
  get '/*ids/add', :to => "wiki_posts#new"
  get '/add', :to => "wiki_posts#new"
  
  get '/*ids', :to => "wiki_posts#show"
  
  post '/*ids/create', :to => "wiki_posts#create"
  post '/create', :to => "wiki_posts#create"
  put '/*ids', :to => "wiki_posts#update"
end
