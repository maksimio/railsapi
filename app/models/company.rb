class Company < ApplicationRecord
    has_many :jobs

    validates :name, :location,  length: { minimum: 2, maximum: 42 }
    validates :name, :location, presence: true


    def self.filter_not_deleted
        where(deleted: false)
    end

    def mark_delete
        self.update(deleted: true)
    end
end
