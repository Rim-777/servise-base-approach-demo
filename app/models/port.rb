# frozen_string_literal: true

class Port < ApplicationRecord
  has_many :origin_port_routes,
           class_name: Route.name,
           foreign_key: :origin_port_id,
           inverse_of: :origin_port

  has_many :destination_port_routes,
           class_name: Route.name,
           foreign_key: :destination_port_id,
           inverse_of: :destination_port

  validates :code, :name, presence: true
  validates :code, uniqueness: true
end
