Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :admin
  devise_for :customers
  get "customers/mypage"=> "customers#show",as: "mypage"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
