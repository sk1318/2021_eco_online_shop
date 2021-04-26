Rails.application.routes.draw do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
   get "admin"=>"admin/homes#top",as: "admin_top"
   devise_for :admin, :controllers => {
    :registrations => 'admin/registrations',
    :sessions => 'admin/sessions'   
   } 
  
  scope module: :public do
    devise_for :customers
    root to: "homes#top"
    get "customers/mypage"=> "customers#show",as: "mypage"
    get "costomers/withdraw"=>"customers#withdraw",as: "withdraw"    
    get "customers/cancellation"=>"customers#cancellation",as: "cancellation"
    resources :customers
  end
end