class Company < ApplicationRecord
    has_many :jobs

    validates :name, :location,  length: { minimum: 2, maximum: 42 }
    validates :name, :location, presence: true
end
