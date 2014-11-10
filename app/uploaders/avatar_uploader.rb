# encoding: utf-8
require 'carrierwave/processing/rmagick'

class AvatarUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  def cache_dir
    "#{Rails.root}/tmp/uploads"
  end

  storage :file


  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  process :resize_to_fit => [300, 400]


  version :form do
    process :resize_to_fit => [200, 300]
  end

  version :thumb do
    process :resize_to_fit => [80, 80]
  end




end
