class InquiryMailer < ApplicationMailer
	def send_mail(inquiry)
		@inquiry = inquiry
		mail(
			from: 'cofee@system.com',
			to: Rails.application.credentials.gmail[:address],
			subject: '問い合わせ'
		)
	end
end
