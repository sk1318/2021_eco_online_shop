class OrdersMailer < ApplicationMailer
  
  def send_mail(order)
  @order = order
  mail(
    from: 'hakumon2021@gmail.com',
    to:   'sk13188559@outlook.jp',
    subject: '【エコ容器オンラインショップ】注文受付完了のお知らせ'
  )
  end
end
