module CommonActions
 #以下extendは必須
  extend ActiveSupport::Concern

  def admin_check
        unless admin_signed_in?
        redirect_to root_path
        end
  end

end