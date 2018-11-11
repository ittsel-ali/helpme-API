class Image < ApplicationRecord
  mount_uploader :file, AvatarUploader

  belongs_to :imagable, polymorphic: true

  after_save :recreate_delayed_versions!

  def recreate_delayed_versions!
    file.should_process = true
    file.recreate_versions!
  end
end
