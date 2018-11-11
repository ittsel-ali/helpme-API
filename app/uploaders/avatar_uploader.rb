class AvatarUploader < CarrierWave::Uploader::Base
  attr_accessor :should_process
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :aws
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def should_process?
    @should_process ||= false
  end

  def image_to_post?(uploaded_file)
    return false unless should_process?

    model.imagable_type.underscore.downcase.to_sym == :post
  end
  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]



  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :small, :if => :image_to_post?  do
    process resize_to_fit: [1080, 760]
    process :add_text
  end

  def add_text
    manipulate! do |image|
      post = Post.find(model.imagable_id)

      image.combine_options do |c|
        c.gravity 'South'
        c.pointsize '100'
        c.draw "text 0,0 '#{post.text}'"
        c.fill 'white'

        c.gravity 'NorthEast'
        c.pointsize '200'
        c.draw "text 0,0 '#{post.price}'"
        c.fill 'white'
      end
      image
    end
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_whitelist
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
