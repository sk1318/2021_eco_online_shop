class Admin::CustomersController < ApplicationController
    include CommonActions

    before_action :admin_check
    
    
    def index
        @customers = Customer.all
    end
end
