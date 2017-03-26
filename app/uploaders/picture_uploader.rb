class PictureUploader < CarrierWave::Uploader::Base
  # image upload with carrierwave
  include Cloudinary::CarrierWave
end
