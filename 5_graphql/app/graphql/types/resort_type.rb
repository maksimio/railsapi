module Types
  class ResortType < Types::BaseObject
    graphql_name 'Resort'
    description 'A Resort Type'

    field :id, GraphQL::Types::ID
    field :name, GraphQL::Types::String
    field :email, GraphQL::Types::String
    field :description, GraphQL::Types::String
    field :apartments, [Types::ApartmentType] do # types declaration for collection
      argument :size, Int, default_value: 15
    end
    def apartments(size:)
      object.apartments.limit(size).order(id: :asc) # :desc
    end
  end
end