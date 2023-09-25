class Log < ApplicationRecord
  belongs_to :admin
  belongs_to :article
  belongs_to :service

  validates :admin, presence: true
end
