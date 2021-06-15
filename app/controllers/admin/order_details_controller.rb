class Admin::OrderDetailsController < ApplicationController
    def update
        @order_detail = OrderDetail.find(params[:id])
        @order_detail.update(order_detail_params)
        @order_detail.save
        
        if @order_detail.production_status_before_type_cast == 2
            @order_detail.order.update(status: 2) 
        end
        
        if @order_detail.order.order_details.all?{|order_detail| order_detail.production_status_before_type_cast== 3}
            @order_detail.order.update(status: 3) 
        end
        
        flash[:notice] = "変更を保存しました"
        redirect_to admin_order_path(@order_detail.order)
    end
    
    
    private
    
    def order_detail_params
        params.require(:order_detail).permit(:production_status)
    end
    
end
