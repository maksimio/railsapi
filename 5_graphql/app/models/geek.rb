class Geek < ApplicationRecord
    has_many :applies

    validates :name, :stack,  length: { minimum: 2, maximum: 42 }
    validates :name, :stack, :resume, presence: true
end
