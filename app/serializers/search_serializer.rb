class SearchSerializer
  include JSONAPI::Serializer
  attributes :departure_date

  belongs_to :route
  has_many :travelers
  has_many :search_results, serializer: Search::ResultSerializer
end
