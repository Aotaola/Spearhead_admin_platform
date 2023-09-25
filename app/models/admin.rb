class Admin < ApplicationRecord

    has_many :articles
    has_many :logs

    validates :name, presence: true
    validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }

    
    has_secure_password

    mount_uploader :photo, ImageUploader

    before_save :downcase_email

    private

    def downcase_email
    self.email = email.downcase
    end


end
