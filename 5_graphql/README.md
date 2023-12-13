# Команды
1. `sudo -i -u postgres psql` - войти в консоль postgres
2. sudo bundle update - 
3. sudo bundle install - 
4. rails middleware - 
5. rails s --binding=0.0.0.0

# PostgreSQL
Роль: rails
Пароль: rails

rails db:migrate
rails db:seed
rails generate migration NewMigration

# GraphQL
1. http://localhost:3000/graphql?query={testField}
2. http://localhost:3000/graphiql (https://github.com/rmosolgo/graphiql-rails) (https://github.com/waiting-for-dev/devise-jwt/issues/235)

```graphql
query {
  resorts: allResorts {
    id
    name
    email
    description
    apts: apartments {
      id
      roomType
      resortId
      description
    }
  }
}
```