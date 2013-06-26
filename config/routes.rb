RateMugwarrior::Application.routes.draw do
  get "beers/index"

  resources :ratings
  resources :beers, only: [:index]


  resources :users, only: [:create] do
  	resources :beers, only: [:index], controller: "users/beers"
  end

  %w[home about].each do |page|
    get page, controller: 'info', action: page
  end


  root to: 'info#home'
end