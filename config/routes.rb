Rails.application.routes.draw do
  root 'users#index'

  post "follow/:id", to: "users#follow", as: "follow"
  post "unfollow/:id", to: "users#unfollow", as: "unfollow"
end
