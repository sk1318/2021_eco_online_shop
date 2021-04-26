class Public::CustomersController < ApplicationController
    before_action :login_check
    before_action :current_customer?,only: [:edit,:update]
    
    def show
    @customer = current_customer
    end
    
    def edit 
    @customer = Customer.find(params[:id])
    end
    
    def update
    @customer = Customer.find(params[:id])
        if @customer.update(customer_params)
            redirect_to mypage_path
        else
            render :edit
        end
    end
    
    
    def cancellation
    end
    
    def withdraw
        customer = current_customer
        customer.is_deleted = true
        customer.update
        redirect_to mypage_path
    end
    
    def login_check
        unless customer_signed_in?
            redirect_to new_customer_session_path
        end
    end
    
    def current_customer?
      cutomer = Customer.find(params[:id])
      unless cutomer == current_customer
          redirect_to mypage_path
      end
    end
    
    private
    
    def customer_params
        params.require(:customer).permit(
            :last_name,:first_name,:last_name_kana,:first_name_kana,:zip_code,:address,:telephone_number,:email
            )
    end
    
    
end
