class Public::CustomersController < ApplicationController
    include CommonActions
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
        customer.update(is_deleted: true)
        reset_session
        flash[:notice]="ご利用ありがとうございました。"
        redirect_to root_path
    end
    
    private
    
    def customer_params
        params.require(:customer).permit(
            :last_name,:first_name,:last_name_kana,:first_name_kana,:zip_code,:address,:telephone_number,:email
            )
    end
    
    
end
