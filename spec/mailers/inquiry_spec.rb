require 'rails_helper'

RSpec.describe InquiryMailer, type: :mailer do
  describe 'when user send inquiry' do
    let(:inquiry) { create(:inquiry) }
    let(:mail) { InquiryMailer.send_mail(inquiry).deliver_now }

    it 'when send an email' do
      expect do
        InquiryMailer.send_mail(inquiry).deliver_now
      end.to change { ActionMailer::Base.deliveries.size }.by(1)
    end

    it 'from of mail' do
      expect(mail.from).to eq ['c0fee@system.com']
    end

    it 'to of mail' do
      expect(mail.to).to eq [Rails.application.credentials.dig(:gmail, :address)]
    end

    it 'subject of mail' do
      expect(mail.subject).to eq Inquiry.model_name.human
    end
  end
end
