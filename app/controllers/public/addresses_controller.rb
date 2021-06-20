class Public::AddressesController < Public::ApplicationController
        before_action :address_edit_check,only: [:edit]
        before_action :set_address,only: [:edit,:update,:destroy]
        
    def index
        @addresses = current_customer.addresses
        @address = Address.new
        if postal_code = params[:postal_code]
          params = URI.encode_www_form({zipcode: postal_code})
          uri = URI.parse("http://zipcloud.ibsnet.co.jp/api/search?#{params}")
          response = Net::HTTP.get_response(uri)
          result = JSON.parse(response.body)
          if result["results"]
            @zipcode = result["results"][0]["zipcode"]
            @address1 = result["results"][0]["address1"]
            @address2 = result["results"][0]["address2"]
            @address3 = result["results"][0]["address3"]
          else
              flash[:error] = "郵便番号が正しく取得できません"
          end
         
        end
    end
    
    def create
        @address = Address.new(address_params)
        @address.customer_id = current_customer.id
        @address.address = "#{params[:address][:address_first]}#{params[:address][:address_last]}"
        if @address.save
        redirect_to addresses_path
        else
        flash[:error]="登録できません"
        redirect_to addresses_path
        end
    end
    
    def edit
    end
    
    def update
        if @address.update(address_params)
        redirect_to addresses_path
        else
        redirect_to edit_address_path(@address)
        end
    end
    
    def destroy
        @address.destroy
        redirect_to addresses_path
    end
    
    private
    
    def address_params
        params.require(:address).permit(:zip_code,:name)
    end
    
    def address_edit_check
        address = Address.find(params[:id])
        unless address.customer == current_customer
            redirect_to mypage_path
        end
    end
    
    def set_address
        @address = Address.find(params[:id])
    end
end
