class Patient < ApplicationRecord
    has_many :appointments, dependent: :destroy
    has_many :doctors, through: :appointments


    has_many :users
    belongs_to :user , foreign_key: :users_id
    def full_name
        "#{self.first_name} #{self.last_name}"
    end
end


