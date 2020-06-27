# Preview all emails at http://localhost:3000/rails/mailers/inquiry
class InquiryPreview < ActionMailer::Preview
  def inquiry
    inquiry = Inquiry.new(name: '俺', message: 'メッセージ', email: 'c0fee@gmail.com')
    InquiryMailer.send_mail(inquiry)
  end
end
