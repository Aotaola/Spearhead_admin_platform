class Service < ApplicationRecord
    has_many :logs

    URL_REGEX = /\A#{URI::regexp(['http', 'https'])}\z/
    
    validates :title, presence: true
    validates :description, presence: true
    validates :url, presence: true, format: { with: URL_REGEX }

    def self.ransackable_attributes(auth_object = nil)
        ["title"]
    end
end
