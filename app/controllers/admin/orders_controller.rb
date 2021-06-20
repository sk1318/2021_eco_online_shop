class Admin::OrdersController < Admin::ApplicationController
    before_action :set_order,only: [:show,:update]
    
    def index
        @orders = Order.all
    end
    
    def show
        @admin = current_admin
    end
    
    def update
        @order.update(order_params)
        flash[:notice] = "変更を保存しました"
        @order.save
        
       if @order.status_before_type_cast == 1
           @order.order_details.update_all(production_status: 1)
       end
        redirect_to admin_order_path(@order)
    end
    
    private
    
    
    def order_params
        params.require(:order).permit(:status)
    end
    
    def set_order
       @order = Order.find(params[:id])
    end
end
