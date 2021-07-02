class Admin::CustomersController < Admin::ApplicationController
    before_action :set_customer,only: [:show,:edit,:update]
    
    def index
        @customers = Customer.all
    end
    
    def show
    end
    
    def edit
    end
    
    def update
        if @customer.update(customer_params)
        redirect_to admin_customer_path(@customer)
        else
        render :edit
        end
    end
    
    private
    
    def set_customer
    @customer = Customer.find(params[:id])
    end
    
    def customer_params
        params.require(:customer).permit(
            :last_name,:first_name,:last_name_kana,:first_name_kana,:zip_code,:address,:telephone_number,:email,:is_deleted
            )
    end
end
