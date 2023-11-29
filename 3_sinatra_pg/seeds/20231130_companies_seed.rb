Sequel.seed(:development, :test) do
  def run
    puts 'Start to write models companies'
    DB[:companies].insert(name: "Gazprom", location: "Saint-Petersburg")
    DB[:companies].insert(name: "Sberbank", location: "Moscow")
    DB[:companies].insert(name: "VTB", location: "Samara")
    puts 'Models companies seeded'
  end
end