RateMugwarrior::Application.routes.draw do

  resources :breweries

  
  resources :beers, only: [:index, :new, :create] do
    resources :ratings
  end


  resources :users, only: [:create] do
  	resources :beers, only: [:index], controller: "users/beers"
  end


  %w[home about].each do |page|
    get page, controller: 'info', action: page
  end


  root to: 'info#home'
end