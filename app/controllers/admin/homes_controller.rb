class Admin::HomesController < ApplicationController
    include CommonActions
    
  before_action :admin_check
    def top
      @admins = Admin.all
    end
end
