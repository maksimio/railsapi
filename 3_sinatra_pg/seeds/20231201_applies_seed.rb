Sequel.seed(:development, :test) do
  def run
    puts 'Start to write models applies'
    DB[:applies].insert(job_id: 1, geek_id: 1)
    DB[:applies].insert(job_id: 1, geek_id: 2)
    DB[:applies].insert(job_id: 2, geek_id: 2)
    puts 'Models applies seeded'
  end
end