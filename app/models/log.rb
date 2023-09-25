class Log < ApplicationRecord
  belongs_to :admin
  belongs_to :article, optional: true
  belongs_to :service, optional: true

  validates :admin, presence: true
end
