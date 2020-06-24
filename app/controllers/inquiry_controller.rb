class InquiryController < ApplicationController
	def index
		@inquiry = Inquiry.new
		render action: :index
	end

	def confirm
		@inquiry = Inquiry.new(inquiry_params)

		if @inquiry.valid?
			render action: :confirm
		else
			render :action :index
		end
	end

	def thanks
		@inquiry = Inquiry.new(inquiry_params)
		InquilyMailer.send_mail(@inquiry).deliver_now

		redirect_to my_page_path(current_user), notice: "お問い合わせありがとうございました。", notice: "お問い合わせ内容を管理者に送信しました。"
	end

	def inquiry_params
		params.require(:inquiry).permit(:name,:email,:message)
	end
end
