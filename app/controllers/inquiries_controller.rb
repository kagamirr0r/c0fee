class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)

    if @inquiry.valid?
      InquiryMailer.send_mail(@inquiry).deliver_now
      flash[:alert] = t('inquiries.flash.Thank_you_for_your_inquiry')
      redirect_to my_page_path(current_user), notice: t('inquiries.flash.Inquiry_sent_to_administrator')
    else
      render :new
    end
  end

  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :message)
  end
end
