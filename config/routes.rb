RateMugwarrior::Application.routes.draw do
  %w[home about].each do |page|
    get page, controller: 'info', action: page
  end

  resources :users, only: [:create]

  root to: 'info#home'
end