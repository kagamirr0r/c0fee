class InquiryMailer < ApplicationMailer
	def send_mail(inquiry)
		@inquiry = inquiry
		mail(
			from: 'cofee@system.com',
			to: 'cofee.manager@gmail.com',
			subject: '問い合わせ'
		)
	end
end
