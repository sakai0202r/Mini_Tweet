if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Amazon S3用の設定
      :provider              => 'AWS',
      :region                => ENV['ap-northeast-1'],
      :aws_access_key_id     => ENV['AKIASVUJIPC7WQXOG53C'],
      :aws_secret_access_key => ENV['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']
    }
    config.fog_directory     =  ENV['private.application.sakai.com']
  end
end
