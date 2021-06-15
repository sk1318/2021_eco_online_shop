class Public::AddressesController < ApplicationController
    include CommonActions
    before_action :login_check
    
    def index
        @addresses = current_customer.addresses
        @address = Address.new
    end
    
    def create
        @address = Address.new(address_params)
        @address.customer_id = current_customer.id
        @address.save
        redirect_to addresses_path
    end
    
    def edit
        @address = Address.find(params[:id])
    end
    
    def update
        @address = Address.find(params[:id])
        @address.update(address_params)
        redirect_to addresses_path
    end
    
    def destroy
        @address = Address.find(params[:id])
        @address.destroy
        redirect_to addresses_path
    end
    
    
    def address_params
        params.require(:address).permit(:zip_code,:address,:name)
    end
end
