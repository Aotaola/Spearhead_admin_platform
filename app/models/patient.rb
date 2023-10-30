class Patient < ApplicationRecord
    has_many :invoices, dependent: :destroy

    validates :name, presence: true
    validates :email, presence: true

    def self.ransackable_attributes(auth_object = nil)
        ["name"]
    end
  
    def self.ransackable_associations(auth_object = nil)
        ["invoices"]
    end
end
