include ActionController::Serialization
class JobSerializer < ActiveModel::Serializer
  attributes :id, :name, :place
end
