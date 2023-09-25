class Service < ApplicationRecord
    has_many :logs

    def self.ransackable_attributes(auth_object = nil)
        ["title"]
    end
end
