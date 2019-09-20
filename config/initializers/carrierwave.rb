CarrierWave.configure do |config|
  config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIA5LZDVI2HECP2SUOG',
      aws_secret_access_key: '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',
      region: 'ap-northeast-1'
  }
  
  config.fog_public     = true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }

  config.fog_directory  = 'c0fee-avatar'
  config.cache_storage = :fog

end
