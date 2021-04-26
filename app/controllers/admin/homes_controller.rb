class Admin::HomesController < ApplicationController
    before_action :admin_check,only: :top
    def top
    end
    
    def admin_check
        unless admin_signed_in?
        redirect_to root_path
        end
    end
end
