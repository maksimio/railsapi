Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  get "/graphql", to: "graphql#execute"
  get 'resort/index'
  get 'resort/show'

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end


  scope module: 'api' do
    namespace :v1 do
      resources :applies do
        match 'mark_deleted', to: 'applies/mark_deleted', via: 'put'
      end
      resources :jobs do
        match 'mark_deleted', to: 'jobs/mark_deleted', via: 'put'
        resources :applies
      end
      resources :geeks do
        match 'mark_deleted', to: 'geeks/mark_deleted', via: 'put'
        resources :applies
      end
      resources :companies do
        match 'mark_deleted', to: 'compaies/mark_deleted', via: 'put'
        resources :jobs
        resources :applies
      end
    end
  end

  match "*path", to: "application#catch_404", via: :all
end
