module CommonActions
 #以下extendは必須
  extend ActiveSupport::Concern

  def admin_check
        unless admin_signed_in?
        redirect_to root_path
        end
  end
  
    
  def current_customer?
    customer = Customer.find(params[:id])
    unless customer == current_customer
        redirect_to mypage_path
    end
  end

end