Rails.application.routes.draw do

  devise_for :users

  resources :forums do
    resources :posts, module: :forums
  end

  root "welcome#index"
end
