CarrierWave.configure do |config|
	unless Rails.env.development? || Rails.env.test?
		config.fog_credentials = {
			provider: "AWS",
			aws_access_key_id: Rails.application.credentials.aws[:access_key_id],
			aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],
			region: "ap-northeast-1"
		}
		config.fog_public = false
		config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" }
		config.fog_directory = "c0fee-private-bucket"
		# config.cache_storage = :fog
	end
end
