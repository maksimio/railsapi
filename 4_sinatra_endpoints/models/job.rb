class Job < Sequel::Model
  many_to_one :company

  def self.company_jobs(id)
    where(company_id: id)
  end
end