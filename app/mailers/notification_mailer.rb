class NotificationMailer < ApplicationMailer
  def notification_mail(blog)
    @blog = blog
    mail(to:@blog.user.email, subject:"【Actionmailer 課題】ブログ作成完のお知らせ")
    #code
  end

end
