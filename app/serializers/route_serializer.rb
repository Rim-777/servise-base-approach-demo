class RouteSerializer
  include JSONAPI::Serializer
  attributes
  belongs_to :origin_port, serializer: PortSerializer
  belongs_to :destination_port, serializer: PortSerializer
end
