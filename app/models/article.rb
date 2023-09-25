class Article < ApplicationRecord
  belongs_to :admin
  has_many :logs

  validates :admin_id, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :body, presence: true


  mount_uploader :photo, ImageUploader

  #after_create :create_log

  # def create_log
  #   Log.create!(article_id: self.id, admin_id: self.admin_id)
  # end

  def self.ransackable_attributes(auth_object = nil)
      ["title"]
  end

  def self.ransackable_associations(auth_object = nil)
      ["admin"]
  end

end
