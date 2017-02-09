Rails.application.routes.draw do
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'urls#index'
  get '/:short_url', to: 'urls#show'
  get 'urls/index'
  post 'urls/create'
  #get '/:id' => "shortener/shortened_urls#show"
  
end
