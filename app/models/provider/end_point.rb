# frozen_string_literal: true

class Provider::EndPoint < ApplicationRecord
  belongs_to :provider, inverse_of: :provider_end_points
  validates :code, :name, :url, :description, presence: true
end
