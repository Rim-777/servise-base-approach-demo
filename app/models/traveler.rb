# frozen_string_literal: true

class Traveler < ApplicationRecord
  has_many :searches_travelers, inverse_of: :traveler, dependent: :destroy
  has_many :searches, through: :searches_travelers
end
