class Admin < ApplicationRecord

    has_many :articles
    
    has_secure_password

    attr_accessor :admin_id

    def self.ransackable_attributes(auth_object = nil)
        ["title", "description"]
    end

    def self.ransackable_associations(auth_object = nil)
        ['admin']
    end

    mount_uploader :photo, ImageUploader
    
end
