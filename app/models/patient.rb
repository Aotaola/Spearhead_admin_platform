class Patient < ApplicationRecord
    has_many :invoices, dependent: :destroy
end
