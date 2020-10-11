class Doctor < ApplicationRecord
	has_many :availabilities
    has_many :appointments, dependent: :destroy
    has_many :patients, through: :appointments
    belongs_to :user , foreign_key: :users_id
end
