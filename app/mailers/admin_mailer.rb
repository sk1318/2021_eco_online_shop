class AdminMailer < ApplicationMailer
  def send_mail(order)
    @order = order
    @admins = Admin.all
    mail(
      from: 'hakumon2021@gmail.com',
      to: @admins.map{|a| a.email},
      subject: '【エコ容器オンラインショップ】注文受付通知'
    )
  end
end
