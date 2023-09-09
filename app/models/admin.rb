class Admin < ApplicationRecord
    has_many :articles
    
    has_secure_password

    mount_uploader :photo, ImageUploader
end
