class Article < ApplicationRecord
  belongs_to :admin

  mount_uploader :photo, ImageUploader

  attr_accessor :admin_id

  def self.ransackable_attributes(auth_object = nil)
      ["title", "description"]
  end

  def self.ransackable_associations(auth_object = nil)
      ['admin']
  end

end
