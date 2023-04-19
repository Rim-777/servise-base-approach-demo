PROVIDERS = [
  {
    name: 'Fancy Journey',
    code: 'fj_provired',
    endpoints: [
      {
        name: 'Search Book',
        code: 'search-book',
        url: 'https://6435508c83a30bc9ad5d5be7.mockapi.io/v1/solution',
        description: 'returns a list of journeys'
      }
    ]
  },
  {
    name: 'Luxury Journey',
    code: 'lj_provired',
    endpoints: [
      {
        name: 'Search Box',
        code: 'search-book',
        url: 'https://64356e1f83a30bc9ad608aa1.mockapi.io/api/v1/search_results',
        description: 'returns a list of journeys'
      }
    ]
  }
].freeze

PORTS = [
  {
    name: 'Tenerife',
    code: 'tfs'
  },
  {
    name: 'Rio de Janeiro',
    code: 'rdj'
  },
  {
    name: 'Morocco',
    code: 'mrc'
  }
].freeze

ActiveRecord::Base.transaction do
  PROVIDERS.each do |provider_attributes|
    provider = Provider.create!(
      name: provider_attributes.fetch(:name),
      code: provider_attributes.fetch(:code)
    )

    provider_attributes.fetch(:endpoints).each do |endpoint_attributes|
      Provider::EndPoint.create!(endpoint_attributes.merge(provider: provider))
    end
  end

  PORTS.each do |port_attributes|
    Port.create!(port_attributes)
  end
end

