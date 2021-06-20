class Admin::HomesController < Admin::ApplicationController
    def top
      @admins = Admin.all
    end
end
