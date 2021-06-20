class Public::AddressesController < Public::ApplicationController
        before_action :address_edit_check,only: [:edit]
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
end
