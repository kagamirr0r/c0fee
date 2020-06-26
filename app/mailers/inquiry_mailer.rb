class InquiryMailer < ApplicationMailer
  def send_mail(inquiry)
    @inquiry = inquiry
    mail(
      from: 'cofee@system.com',
      to: 'cofee.manager@gmail.com',
      subject: Inquiry.model_name.human
    )
  end
end
