Sequel.seed(:development, :test) do
  def run
    puts 'Start to write models jobs'
    DB[:jobs].insert(name: "Full-stack developer", place: "Moscow", company_id: 1)
    DB[:jobs].insert(name: "DevOps Engineer", place: "Samara", company_id: 2)
    DB[:jobs].insert(name: "QA Engineer", place: "Saint-Petersburg", company_id: 3)
    DB[:jobs].insert(name: "System architect", place: "Moscow", company_id: 1)
    puts 'Models jobs seeded'
  end
end