RateMugwarrior::Application.routes.draw do
  resources :breweries


  %w[home about].each do |page|
    get page, controller: 'info', action: page
  end

  resources :users, only: [:create]

  root to: 'info#home'
end