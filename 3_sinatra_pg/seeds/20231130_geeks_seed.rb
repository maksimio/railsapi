Sequel.seed(:development, :test) do
  def run
    puts 'Start to write models geeks'
    DB[:geeks].insert(name: "Andrey", stack: "some_stack_1", resume: "cv_1")
    DB[:geeks].insert(name: "Ivan", stack: "some_stack_2", resume: "cv_2")
    DB[:geeks].insert(name: "Alexander", stack: "some_stack_3", resume: "cv_3")
    puts 'Models geeks seeded'
  end
end