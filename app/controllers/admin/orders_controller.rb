class Admin::OrdersController < Admin::ApplicationController
    def index
        @orders = Order.all
    end
    
    def show
        @order = Order.find(params[:id])
        @admin = current_admin
    end
    
    def update
        @order = Order.find(params[:id])
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
end
