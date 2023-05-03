# frozen_string_literal: true

class SearchesTraveler < ApplicationRecord
  belongs_to :search, inverse_of: :searches_travelers
  belongs_to :traveler, inverse_of: :searches_travelers
end
