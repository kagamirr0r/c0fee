class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
  end

  def create
		@inquiry = Inquiry.new(inquiry_params)

		if @inquiry.valid?
			InquiryMailer.send_mail(@inquiry).deliver_now
			flash[:alert] = 'お問い合わせありがとうございました。'
			redirect_to my_page_path(current_user), notice: 'お問い合わせ内容を管理者に送信しました。'
		else
			render :new
		end

	end

  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :message)
  end
end
