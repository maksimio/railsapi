module Types
  class ApartmentType < Types::BaseObject
    graphql_name 'Apartment'
    description 'An Apartment Type'
    field :id, GraphQL::Types::ID
    field :room_type, GraphQL::Types::String
    field :description, GraphQL::Types::String
    field :resort_id, GraphQL::Types::ID
  end
end
