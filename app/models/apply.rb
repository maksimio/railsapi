class Apply < ApplicationRecord
    belongs_to :geek
    belongs_to :job

    validates :geek_id, :job_id, presence: true
    validates :geek_id, :job_id, numericality: { only_integer: true }
    validates :read, :invited, inclusion: [true, false]
end
