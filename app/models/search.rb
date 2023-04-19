# frozen_string_literal: true

class Search < ApplicationRecord
  belongs_to :route, inverse_of: :searches
  has_many :searches_travelers, inverse_of: :search, dependent: :destroy
  has_many :travelers, through: :searches_travelers
  has_many :search_results,
           class_name: Search::Result.name,
           inverse_of: :search,
           dependent: :destroy
end
