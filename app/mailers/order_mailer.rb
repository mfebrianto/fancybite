class OrderMailer < ActionMailer::Base

  default from: 'order@fancybite.com'

  def order_confirmation(customer)
    # @user = user
    # @url  = 'http://example.com/login'
    mail(to: customer.email, subject: 'Fancybite order detail')
  end

end