class Job < ApplicationRecord
    belongs_to :company
    has_many :applies

    validates :name, :place,  length: { minimum: 2, maximum: 42 }
    validates :name, :place, :company_id, presence: true
    validates :company_id, numericality: { only_integer: true }
end
