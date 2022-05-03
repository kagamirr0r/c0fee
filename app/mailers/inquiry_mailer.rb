class InquiryMailer < ApplicationMailer
  def send_mail(inquiry)
    @inquiry = inquiry
    mail(
      from: 'c0fee@system.com',
      to: Rails.application.credentials.dig(:gmail, :address),
      subject: Inquiry.model_name.human
    )
  end
end
