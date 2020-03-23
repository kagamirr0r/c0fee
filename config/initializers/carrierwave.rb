if Rails.env.production?
	Carrierwave.configure do |config|
		config.fog_credentials = {
			provider: "AWS",
			aws_access_key_id: Rails.application.credentials.aws[:access_key_id],
			aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],
			region: "ap-northeast-1"
		}

		config.fog_directory = 'c0fee-private'
		config.cache_storage = :fog
		# config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" }
	end
end
