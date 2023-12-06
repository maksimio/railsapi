## Команды

rake db:migrate
rake db:migrate --trace

rake db:version --trace

bundle exec rackup -p 4567 config.ru

rake task db:seed

sequel  postgres://sinatra_admin:password@localhost/sinatra_seq_dev
dataset = DB[:companies] 
dataset2 = dataset.select(:id, :name).order(:name).where{id < 3}
dataset2.all
dataset.all
dataset.count


## TODO:
1. routes и controllers - одно и то же?
2. комментарий к get '/jobs'
3. geeks_routes - параметр со знаком вопроса можно делать (важно оставить слеш)