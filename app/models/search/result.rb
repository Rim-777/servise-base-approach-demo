# frozen_string_literal: true

class Search::Result < ApplicationRecord
  belongs_to :search, inverse_of: :search_results

  validates :origin_port,
            :destination_port,
            :departure_date,
            :traveler_class,
            presence: true
end
