Rails.application.routes.draw do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root to: "public/homes#top"
   get "about"=> "public/homes#about",as: "about"
   get "admin"=>"admin/homes#top",as: "admin_top"
   
  namespace :admin do
   resources :items
   resources :customers
   resources :genres
   resources :orders
   resources :order_details
  end
  
   devise_for :admin, :controllers => {
    :registrations => 'admin/registrations',
    :sessions => 'admin/sessions'   
   } 
  
  
  scope module: :public do
    devise_for :customers
    get "customers/mypage"=> "customers#show",as: "mypage"
    patch "costomers/withdraw"=>"customers#withdraw",as: "withdraw"    
    get "customers/cancellation"=>"customers#cancellation",as: "cancellation"
    resources :customers
    resources :items
    delete "cart_items/destroy_all"=>"cart_items#destroy_all",as: "destroy_all"
    resources :cart_items
    post "orders/confirm"=>"orders#confirm",as: "confirm"
    get "orders/done"=> "orders#done",as: "done"
    resources :orders
    resources :addresses
  end
end