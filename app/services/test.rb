class Test
  def self.attributes
    {
      data: {
        route_attributes: {
          origin_port_code: 'tfs',
          destination_port_code: 'rdj'
        },
        departure_date: '2023-11-11',
        travelers_attributes: [
          {
            quantity: 1,
            type: 'Traveler::Adult'
          },
          {
            quantity: 1,
            type: 'Traveler::Child'
          }
        ]
      }
    }
  end
end
