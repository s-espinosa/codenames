Rails.application.routes.draw do
  Rails.application.routes.draw do
    get "/", to: "games#new"

    resources :games, only: [:new, :create, :show]
  end
end
