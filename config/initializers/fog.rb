CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => ENV['S3_ACCESS_KEY'],                        # required
    :aws_secret_access_key  => ENV['S3_ACCESS_PASSWORD'],                        # required
    :region                 => 'us-west-2',                  # optional, defaults to 'us-east-1'
    :host                   => 'nil',             # optional, defaults to nil
    :endpoint               => 'nil' # optional, defaults to nil
  }
  config.fog_directory  = 'dalaitest'                     # required
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end