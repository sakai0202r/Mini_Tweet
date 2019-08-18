if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIASVUJIPC7WQXOG53C',
      aws_secret_access_key: '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',
      region: 'ap-northeast-1'
    }

    config.fog_directory  = 'private.application.sakai.com'
    config.cache_storage = :fog
  end
end
