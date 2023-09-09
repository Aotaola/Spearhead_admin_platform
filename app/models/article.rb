class Article < ApplicationRecord
  belongs_to :admin

  mount_uploader :photo, ImageUploader
end
