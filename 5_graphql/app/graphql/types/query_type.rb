module Types
  class QueryType < GraphQL::Schema::Object
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :all_resorts, [ResortType], 'All Resorts everywhere'do
      argument :size, Int, required: false, default_value: 15
    end
    def all_resorts(size:)
      Resort.all.limit(size).order(id: :asc)
    end

    field :resort, ResortType, 'One Resort by its ID'do
      argument :id, Int, required: true
    end
    def resort(id:)
      Resort.find(id)
    end

    field :all_apartments, [ApartmentType], 'All Apartment everywhere'do
      argument :size, Int, required: false, default_value: 15
    end
    def all_apartments(size:)
      Apartment.all.limit(size).order(id: :asc)
    end

    field :apartment, ApartmentType, 'One Apartment by its ID'do
      argument :id, Int, required: true
    end
    def apartment(id:)
      Apartment.find(id)
    end
  end
end