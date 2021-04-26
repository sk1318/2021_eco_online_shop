class Admin::CustomersController < ApplicationControllerbefore_action :admin_check
    　
    def index
        @customers = Customer.all
    end
    
    def admin_check
        unless admin_signed_in?
        redirect_to root_path
        end
    end
end
