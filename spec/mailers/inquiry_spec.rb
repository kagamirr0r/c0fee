require 'rails_helper'

RSpec.describe InquiryMailer, type: :mailer do
	describe "when user send inquiry" do
		let(:inquiry) { create(:inquiry) }
		let(:mail) { InquiryMailer.send_mail(inquiry).deliver_now }

		it "when send an email" do
			expect do
				InquiryMailer.send_mail(inquiry).deliver_now
			end.to change { ActionMailer::Base.deliveries.size }.by(1)
		end

		it "subject of mail" do
			expect(mail.subject).to eq Inquiry.model_name.human
		end
  end
end
