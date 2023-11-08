class Patient < ApplicationRecord
    has_many :invoices, dependent: :destroy

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :phone_number, presence: true
    validates :password_digest, presence: true
    validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }

    has_secure_password

    before_save :downcase_email

    ransacker :full_name do |parent|
        Arel::Nodes::InfixOperation.new('||',
          parent.table[:first_name], parent.table[:last_name])
      end

    def self.ransackable_attributes(auth_object = nil)
        ["full_name", "email", "insurance", "phone_number"]
    end
  
    def self.ransackable_associations(auth_object = nil)
        ["invoices"]
    end
    def name
        "#{first_name} #{last_name}"
    end


    private

    def downcase_email
    self.email = email.downcase
    end

end
