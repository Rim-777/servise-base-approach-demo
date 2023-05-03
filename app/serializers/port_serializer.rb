class PortSerializer
  include JSONAPI::Serializer
  attributes :name, :code
end
