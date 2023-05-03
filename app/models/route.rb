# frozen_string_literal: true

class Route < ApplicationRecord
  belongs_to :origin_port,
             class_name: Port.name,
             foreign_key: :origin_port_id,
             inverse_of: :origin_port_routes

  belongs_to :destination_port,
             class_name: Port.name,
             foreign_key: :destination_port_id,
             inverse_of: :destination_port_routes

  has_many :searches, inverse_of: :route

  validates :origin_port_id, uniqueness: { scope: :destination_port_id }
end
